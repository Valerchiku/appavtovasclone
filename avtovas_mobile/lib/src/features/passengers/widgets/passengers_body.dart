import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_container.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengersBody extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengersBody({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengersBody> createState() => _PassengersBodyState();
}

class _PassengersBodyState extends State<PassengersBody> {
  late final PageController _pageController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _scrollController = ScrollController();
  }

  void _animateToPage(int pageIndex) {
    widget.cubit.changePageIndex(pageIndex);

    if (pageIndex == 0) {
      widget.cubit.clearCurrentPassenger();
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      );
    }

    final currentPageIndex = _pageController.page!;

    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: currentPageIndex > pageIndex
          ? Curves.decelerate
          : Curves.fastOutSlowIn,
    );
  }

  Future<bool> _onWillPop() async {
    if (_pageController.page! > 0) {
      _animateToPage(0);
      return false;
    }

    return true;
  }

  bool _listenWhen(PassengersState prev, PassengersState current) {
    return !prev.isBackButtonPressed && current.isBackButtonPressed;
  }

  void _listener(BuildContext context, PassengersState state) {
    if (state.isBackButtonPressed) {
      _pageController.page! > 0
          ? _animateToPage(0)
          : widget.cubit.onBackButtonTap();

      widget.cubit.changeBackButtonStatus();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      listener: _listener,
      listenWhen: _listenWhen,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (_, index) {
              if (index == 0) {
                return PassengersList(
                  cubit: widget.cubit,
                  onPassengerTap: (passenger) {
                    widget.cubit
                      ..changePassengerStatus(isNewPassenger: false)
                      ..setExistentPassenger(passenger);
                    _animateToPage(1);
                  },
                  onAddPassengerTap: () {
                    widget.cubit.changePassengerStatus(isNewPassenger: true);
                    _animateToPage(1);
                  },
                );
              }
              return ListView(
                controller: _scrollController,
                children: [
                  PassengerContainer(
                    state: state,
                    onClose: () => _animateToPage(0),
                    updatePassengers: state.isNewPassenger
                        ? widget.cubit.addPassenger
                        : widget.cubit.updatePassenger,
                    removePassenger: state.isNewPassenger
                        ? null
                        : widget.cubit.removePassenger,
                    onSurnameVisibleChanged: (value) =>
                        widget.cubit.changeSurnameVisibility(
                      noSurname: value,
                    ),
                    onPassengerChanged: widget.cubit.changeCurrentPassenger,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
