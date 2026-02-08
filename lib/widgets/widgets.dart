import 'package:flutter/material.dart';

//
//  這裏是閑下來的時候自己寫的一些表現力組件。當然可以直接用哦，畢竟沒什麽技術含量
//  摸摸頭，愛你們喲 (＾Ｕ＾)ノ~ＹＯ
//

class ExpressiveFilledButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ExpressiveFilledButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.backgroundColor,
      this.foregroundColor});

  @override
  State<ExpressiveFilledButton> createState() => _ExpressiveFilledButtonState();
}

class _ExpressiveFilledButtonState extends State<ExpressiveFilledButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _borderRadiusAnimation;
  late Animation<double> _widthAnimation;
  final GlobalKey _containerKey = GlobalKey();
  double _childWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _borderRadiusAnimation = Tween<double>(
      begin: 48.0,
      end: 4.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _widthAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateChildWidth();
    });
  }

  void _updateChildWidth() {
    final RenderBox renderBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      _childWidth = renderBox.size.width;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget coloredChild;
    if (widget.child is Icon) {
      coloredChild = Icon(
        (widget.child as Icon).icon,
        color:
            widget.foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
      );
    } else if (widget.child is Text) {
      coloredChild = Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Text(
          (widget.child as Text).data!,
          style: (widget.child as Text).style?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ) ??
              TextStyle(
                  color: widget.foregroundColor ??
                      Theme.of(context).colorScheme.onPrimary),
        ),
      );
    } else {
      coloredChild = widget.child;
    }
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        _controller.reverse();
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            key: _containerKey,
            width: _childWidth > 0 ? _childWidth * _widthAnimation.value : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
              color: widget.backgroundColor ??
                  Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Center(child: coloredChild),
          );
        },
      ),
    );
  }
}

class ExpressiveOutlinedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const ExpressiveOutlinedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<ExpressiveOutlinedButton> createState() =>
      _ExpressiveOutlinedButtonState();
}

class _ExpressiveOutlinedButtonState extends State<ExpressiveOutlinedButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _borderRadiusAnimation;
  late Animation<double> _widthAnimation;
  final GlobalKey _containerKey = GlobalKey();
  double _childWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _borderRadiusAnimation = Tween<double>(
      begin: 48.0,
      end: 4.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _widthAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateChildWidth();
    });
  }

  void _updateChildWidth() {
    final RenderBox renderBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      _childWidth = renderBox.size.width;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget coloredChild;
    if (widget.child is Icon) {
      coloredChild = Icon(
        (widget.child as Icon).icon,
        color: Theme.of(context).colorScheme.primary,
      );
    } else if (widget.child is Text) {
      coloredChild = Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Text(
          (widget.child as Text).data!,
          style: (widget.child as Text).style?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ) ??
              TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    } else {
      coloredChild = widget.child;
    }
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        _controller.reverse();
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            key: _containerKey,
            width: _childWidth > 0 ? _childWidth * _widthAnimation.value : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 1),
            ),
            padding:
                const EdgeInsets.only(top: 11, bottom: 11, left: 12, right: 12),
            child: Center(child: coloredChild),
          );
        },
      ),
    );
  }
}

class ExpressiveFloatingActionButton extends StatefulWidget {
  final List<ActionItem> actionItems;
  final IconData defaultIcon; // 默认为加号
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ExpressiveFloatingActionButton({
    super.key,
    required this.actionItems,
    this.defaultIcon = Icons.add, // 未展开默认显示加号
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<ExpressiveFloatingActionButton> createState() =>
      _ExpressiveFloatingActionButtonState();
}

class _ExpressiveFloatingActionButtonState
    extends State<ExpressiveFloatingActionButton>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _onActionTap(VoidCallback onTap) {
    onTap();
    _toggleExpand();
  }

  @override
  Widget build(BuildContext context) {
    // 基础颜色配置
    final theme = Theme.of(context);
    final defaultBgColor =
        widget.backgroundColor ?? theme.colorScheme.primaryContainer;
    final expandedBgColor = theme.colorScheme.primary; // 展開後背景色
    final defaultFgColor =
        widget.foregroundColor ?? theme.colorScheme.onPrimaryContainer;
    final expandedFgColor = theme.colorScheme.onPrimary; // 展開後前景色

    final screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomRight, // 保持FAB在右下角
      children: [
        if (_isExpanded)
          Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.black.withOpacity(0),
            child: GestureDetector(
              // 點擊空白處收起FAB
              onTap: _toggleExpand,
              behavior: HitTestBehavior.translucent,
              child: AnimatedOpacity(
                opacity: _isExpanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.all(16.0), // 保持FAB右下角邊距
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 展開的動作卡片列表
              if (_isExpanded)
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: widget.actionItems
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: _ActionCapsule(
                                icon: item.icon,
                                label: item.label,
                                onTap: () => _onActionTap(item.onTap),
                              ),
                            ))
                        .toList(),
                  ),
                ),

              // 主FAB按鈕
              SizedBox(
                width: 56,
                height: 56,
                child: FloatingActionButton(
                  onPressed: _toggleExpand,
                  backgroundColor: _isExpanded ? expandedBgColor : defaultBgColor,
                  foregroundColor: _isExpanded ? expandedFgColor : defaultFgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_isExpanded ? 28 : 16),
                  ),
                  elevation: 6,
                  child: _isExpanded
                      ? const Icon(Icons.close, size: 24)
                      : Icon(widget.defaultIcon, size: 24),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionCapsule extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCapsule({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 22,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 工具枚舉
class ActionItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
