import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/home_page.dart';
import 'pages/recycle_bin_page.dart';
import 'pages/secure_folder_page.dart';
import 'pages/storage_analyzer_page.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RawFileManagerApp());
}

// 从 StatelessWidget 转换为 StatefulWidget
class RawFileManagerApp extends StatefulWidget {
  const RawFileManagerApp({super.key});

  @override
  State<RawFileManagerApp> createState() => _RawFileManagerAppState();
}

class _RawFileManagerAppState extends State<RawFileManagerApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // 定义亮色和暗色主题色板
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          // 使用系统动态颜色
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: Color(lightDynamic.primary.toARGB32()),
            brightness: Brightness.light,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: Color(darkDynamic.primary.toARGB32()),
            brightness: Brightness.dark,
          );
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          );
        }

        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor:
                Theme.brightnessOf(context) == Brightness.light
                    ? lightColorScheme.surface
                    : darkColorScheme.surface,
            systemNavigationBarIconBrightness:
                Theme.brightnessOf(context) == Brightness.light
                    ? Brightness.dark
                    : Brightness.light,
          ),
          child: MaterialApp(
            title: 'Raw File Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
            ),
            // 使用系统默认的主题模式（跟随系统）
            themeMode: ThemeMode.system,
            home: const NavigatorHome(),
            routes: {
              '/recycle_bin': (_) => const RecycleBinPage(),
              '/secure_folder': (_) => const SecureFolderPage(),
              '/storage_analyzer': (_) => const StorageAnalyzerPage(),
            },
          ),
        );
      },
    );
  }
}

class NavigatorHome extends StatefulWidget {
  const NavigatorHome({super.key});

  @override
  State<NavigatorHome> createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorHome> {
  int _pageIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    RecycleBinPage(),
    SecureFolderPage(),
    StorageAnalyzerPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      // 判断是否为横屏
      bool isLandscape = orientation == Orientation.landscape;

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isLandscape)
            Expanded(
              flex: 1,
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      const DrawerHeader(
                        child: Text(
                          "Raw File Manager",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 0
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(128)),
                        ),
                        leading: const Icon(Icons.home),
                        title: const Text("Home"),
                        onTap: () => setState(() => _pageIndex = 0),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 1
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(128)),
                        ),
                        leading: const Icon(Icons.delete),
                        title: const Text("Recycle Bin"),
                        onTap: () => setState(() => _pageIndex = 1),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 2
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(128)),
                        ),
                        leading: const Icon(Icons.lock),
                        title: const Text("Secure Folder"),
                        onTap: () => setState(() => _pageIndex = 2),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 3
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(128)),
                        ),
                        leading: const Icon(Icons.pie_chart),
                        title: const Text("Storage Analyzer"),
                        onTap: () => setState(() => _pageIndex = 3),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 4
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(128)),
                        ),
                        leading: const Icon(Icons.settings),
                        title: const Text("Settings"),
                        onTap: () => setState(() => _pageIndex = 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 3,
            child: Scaffold(
              drawer: isLandscape
                  ? null
                  : Drawer(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView(
                          children: [
                            const DrawerHeader(
                              child: Text(
                                "Raw File Manager",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            ListTile(
                              tileColor: _pageIndex == 0
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(128)),
                              ),
                              leading: const Icon(Icons.home),
                              title: const Text("Home"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() => _pageIndex = 0);
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 1
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(128)),
                              ),
                              leading: const Icon(Icons.delete),
                              title: const Text("Recycle Bin"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() => _pageIndex = 1);
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 2
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(128)),
                              ),
                              leading: const Icon(Icons.lock),
                              title: const Text("Secure Folder"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() => _pageIndex = 2);
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 3
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(128)),
                              ),
                              leading: const Icon(Icons.pie_chart),
                              title: const Text("Storage Analyzer"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() => _pageIndex = 3);
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 4
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(128)),
                              ),
                              leading: const Icon(Icons.settings),
                              title: const Text("Settings"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() => _pageIndex = 4);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              body: _pages[_pageIndex],
              floatingActionButton: isLandscape
                  ? null
                  : const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 2),
                        DrawerButton(),
                      ],
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startTop,
            ),
          ),
        ],
      );
    });
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
