import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/recycle_bin_page.dart';
import 'pages/secure_folder_page.dart';
import 'pages/storage_analyzer_page.dart';

void main() {
  runApp(const RawFileManagerApp());
}

class RawFileManagerApp extends StatelessWidget {
  const RawFileManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raw File Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // 启用 Material 3
      ),
      home: NavigatorHome(),
      routes: {
        '/recycle_bin': (_) => const RecycleBinPage(),
        '/secure_folder': (_) => const SecureFolderPage(),
        '/storage_analyzer': (_) => const StorageAnalyzerPage(),
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
  final List<Widget> _pages = [
    const HomePage(),
    const RecycleBinPage(),
    const SecureFolderPage(),
    const StorageAnalyzerPage(),
    const SettingsPage()
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
                        child: Text("Raw File Manager",
                            style: TextStyle(fontSize: 24)),
                      ),
                      ListTile(
                        tileColor: _pageIndex == 0
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(128))),
                        leading: const Icon(Icons.home),
                        title: const Text("Home"),
                        onTap: () {
                          //Navigator.of(context).pop();
                          setState(() {
                            _pageIndex = 0;
                          });
                        },
                      ),
                      ListTile(
                        tileColor: _pageIndex == 1
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        //tileColor: ModalRoute.of(context)?.settings.name == '/recycle_bin'?Theme.of(context).colorScheme.primaryContainer:null,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(128))),
                        leading: const Icon(Icons.delete),
                        title: const Text("Recycle Bin"),
                        onTap: () {
                          //Navigator.of(context).pop();
                          setState(() {
                            _pageIndex = 1;
                          });
                        },
                      ),
                      ListTile(
                        tileColor: _pageIndex == 2
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        //tileColor: ModalRoute.of(context)?.settings.name == '/secure_folder'?Theme.of(context).colorScheme.primaryContainer:null,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(128))),
                        leading: const Icon(Icons.lock),
                        title: const Text("Secure Folder"),
                        onTap: () {
                          //Navigator.of(context).pop();
                          setState(() {
                            _pageIndex = 2;
                          });
                        },
                      ),
                      ListTile(
                        tileColor: _pageIndex == 3
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        //tileColor: ModalRoute.of(context)?.settings.name == '/storage_analyzer'?Theme.of(context).colorScheme.primaryContainer:null,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(128))),
                        leading: const Icon(Icons.pie_chart),
                        title: const Text("Storage Analyzer"),
                        onTap: () {
                          //Navigator.of(context).pop();
                          setState(() {
                            _pageIndex = 3;
                          });
                        },
                      ),
                      ListTile(
                        tileColor: _pageIndex == 4
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        //tileColor: ModalRoute.of(context)?.settings.name == '/storage_analyzer'?Theme.of(context).colorScheme.primaryContainer:null,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(128))),
                        leading: const Icon(Icons.settings),
                        title: const Text("Settings"),
                        onTap: () {
                          //Navigator.of(context).pop();
                          setState(() {
                            _pageIndex = 4;
                          });
                        },
                      ),
                    ],
                  ),
                ))),
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
                              child: Text("Raw File Manager",
                                  style: TextStyle(fontSize: 24)),
                            ),
                            ListTile(
                              tileColor: _pageIndex == 0
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : null,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(128))),
                              leading: const Icon(Icons.home),
                              title: const Text("Home"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _pageIndex = 0;
                                });
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 1
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : null,
                              //tileColor: ModalRoute.of(context)?.settings.name == '/recycle_bin'?Theme.of(context).colorScheme.primaryContainer:null,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(128))),
                              leading: const Icon(Icons.delete),
                              title: const Text("Recycle Bin"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _pageIndex = 1;
                                });
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 2
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : null,
                              //tileColor: ModalRoute.of(context)?.settings.name == '/secure_folder'?Theme.of(context).colorScheme.primaryContainer:null,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(128))),
                              leading: const Icon(Icons.lock),
                              title: const Text("Secure Folder"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _pageIndex = 2;
                                });
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 3
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : null,
                              //tileColor: ModalRoute.of(context)?.settings.name == '/storage_analyzer'?Theme.of(context).colorScheme.primaryContainer:null,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(128))),
                              leading: const Icon(Icons.pie_chart),
                              title: const Text("Storage Analyzer"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _pageIndex = 3;
                                });
                              },
                            ),
                            ListTile(
                              tileColor: _pageIndex == 4
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : null,
                              //tileColor: ModalRoute.of(context)?.settings.name == '/storage_analyzer'?Theme.of(context).colorScheme.primaryContainer:null,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(128))),
                              leading: const Icon(Icons.settings),
                              title: const Text("Settings"),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _pageIndex = 4;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                body: _pages[_pageIndex],
                floatingActionButton: isLandscape
                    ? null
                    : const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          DrawerButton()
                        ],
                      ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startTop,
              ))
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
