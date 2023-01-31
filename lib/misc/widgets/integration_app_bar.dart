import 'package:flutter/material.dart';
import 'package:integration_flutter_app/misc/widgets/integration_back_button.dart';

class IntegrationAppBarAction {
  final IconData? icon;
  final String title;
  final VoidCallback action;

  const IntegrationAppBarAction({
    required this.title,
    required this.action,
    this.icon,
  });
}

class IntegrationAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final List<IntegrationAppBarAction>? actions;
  final bool showBackButton;
  final bool forceThreeDots;
  final VoidCallback? onBackAction;
  final String forceFirstAction;
  final Widget? leading;

  const IntegrationAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.forceThreeDots = false,
    this.leading,
    this.onBackAction,
    this.forceFirstAction = "",
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(0, 50);

  Widget getIndicatorText(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 3),
      child: Center(
        child: Text(
          title,
        ),
      ),
    );
  }

  Widget _getLeading() {
    if (leading != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: leading,
        ),
      );
    } else if (showBackButton) {
      return IntegrationBackButton(onBackAction: onBackAction);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: _getLeading(),
          leadingWidth: leading != null ? 200 : 50,
          title: title,
          centerTitle: true,
          titleSpacing: 12.0,
          actions: actions != null
              ? actions!.length <= 1 && !forceThreeDots
                  ? actions
                      ?.map((e) => InkWell(
                          onTap: () => e.action(),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Center(
                                child: getIndicatorText(context, e.title)),
                          )))
                      .toList()
                  : [
                      PopupMenuButton(
                        itemBuilder: (context) => actions!
                            .map(
                              (e) => PopupMenuItem(
                                value: actions?.indexOf(e),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.title,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    if (e.icon != null)
                                      Icon(
                                        e.icon,
                                        size: 20,
                                        color: Colors.black,
                                      )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onSelected: (int value) => actions?[value].action(),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        tooltip: "",
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: forceFirstAction == ""
                              ? const Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                )
                              : getIndicatorText(context, forceFirstAction),
                        ),
                      )
                    ]
              : null,
        ));
  }
}
