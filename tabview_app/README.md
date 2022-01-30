# Flutter TabBar and SliverAppBar

In this tutorial, I'll show you how to use tabs with SliverAppBar in your flutter app.

This what the final result will look like:

![Result][img.result]

### Video on `Youtube`:
[![Part 1](https://img.youtube.com/vi/p0VBhqKwWCs/maxresdefault.jpg)](https://youtu.be/p0VBhqKwWCs)

#### Table of contents
- [Implement TabBar](#implement-tabbar)
- [Customize TabBar](#customize-tabbar)

## Implement TabBar
To implement TabBar and SliverAppBar in your app, follow these steps:

1. Wrap the `Scraffold` widget inside the `DefaultTabController`.
2. Wrap the `TabBar` widget inside the `flexibleSpaceBar` from `SliverAppBar` as a `CustomScrollView`'s `slivers` property.
3. Provide `TabBarView` as a `child` of the `SliverToBoxAdapter`. 

Here's example:
```dart
@override
Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: CustomScrollView(
                slivers: [
                    SliverAppBar(
                        ....
                        flexibleSpace: FlexibleSpaceBar(
                            ...
                            child: TabBar(
                                ...
                                ...
                                tabs: [
                                    Tab(...),
                                    Tab(...),
                                    Tab(...),
                                ],
                            ),
                        ),
                    ),
                    SliverToBoxAdapter(
                        ...
                        child: TabBarView(
                            children: [
                                Containter(...),
                                Containter(...),
                                Containter(...),
                            ],
                        ),
                    ),
                ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                ...
                items: [
                    BottomNavigationBarItem(...),
                    BottomNavigationBarItem(...),
                    BottomNavigationBarItem(...),
                ],
            ),
        ),        
    );
} 
```
## Customize TabBar
I make this changes to customize my tab:

1. Make rounded border with `BorderRadius.circular(50)` and white color.
2. Change `labelColor` property to `0xFF525453`.
3. Make selected label style to bold.
4. Make unselected label style to normal.

```dart
child: TabBar(
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
    ),
    labelColor: const Color(0xFF142A8F),
    unselectedLabelColor: const Color(0xFF525354),
    labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
    ),
    tabs: [...]
    ...
),
```
## Conclusion
In this tutorial, I shown you how to add TabBar and SliverAppBar in your flutter app.
For full walk through you can follow me on the video on Youtube.

[img.result]: images/img_01.png