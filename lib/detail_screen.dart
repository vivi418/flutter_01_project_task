import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_todo/model/ProjectTask.dart';
import 'package:flutter/gestures.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

class DetailScreen extends StatelessWidget {
  final ProjectTask task;

  const DetailScreen({Key? key, required this.task}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 450) {
          return DetailWebPage(task: task);
        } else {
          return DetailMobilePage(task: task);
        }
      },
    );
  }
}

class DetailWebPage extends StatelessWidget{
  final ProjectTask task;

  const DetailWebPage({Key? key, required this.task}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.shade900.withOpacity(0.9),
                Colors.blue.shade400
              ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              )
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top:10, left:30, right:30, bottom: 10),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const BookmarkButton(),
                      ],
                    ),
                    Text(
                        task.name,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white
                        ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.people,
                              size: 22,
                              color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                              task.project,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )
                          ),
                          const SizedBox(width: 20,),
                          PriorityStars(priority: task.priority),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left:30, right:30),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 115,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade400
                          ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.notifications,
                              size: 18,
                              color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                              task.deadlineDate,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 110,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade400
                          ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.edit_document,
                              size: 20,
                              color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                              task.status,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 110,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade400
                          ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.track_changes,
                              size: 20,
                              color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                              task.tracker,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const SizedBox(height: 10,),
                      ViewWeb(description: task.description, todoList: task.todoList,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final ProjectTask task;

  const DetailMobilePage({Key? key, required this.task}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade900.withOpacity(0.9),
              Colors.blue.shade400
            ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top:50, left:30, right:30, bottom: 40),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20, color:
                            Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const BookmarkButton(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      task.name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      )
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:30, right:30, bottom:30),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: 115,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade600,
                          Colors.blue.shade400
                        ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight
                        )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.notifications,
                          size: 18,
                          color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            task.deadlineDate,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade400
                          ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.people,
                              size: 20,
                              color: Colors.white
                          ),
                          const SizedBox(width: 5,),
                          Text(
                              task.project,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            flex: 4, // Adjust the flex values based on your layout needs
                            child: Container(
                              height: 30,
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  const Icon(Icons.edit_document, size: 20, color: Colors.black),
                                  const SizedBox(width: 5,),
                                  Text(
                                    task.status,
                                    style: const TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 30,
                              child: PriorityStars(priority: task.priority),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            const Icon(Icons.track_changes, size: 20, color: Colors.black),
                            const SizedBox(width: 5,),
                            Text(
                              task.tracker,
                              style: const TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      View(description: task.description, todoList: task.todoList,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}

class PriorityStars extends StatelessWidget {
  final String priority;

  const PriorityStars({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Icon(
          Icons.star,
          color: _getStarColor(index),
          size: 18,
        );
      }),
    );
  }

  Color _getStarColor(int index) {
    if (priority == 'High') {
      return Colors.yellow.shade700;
    } else if (priority == 'Mid') {
      return index < 2 ? Colors.yellow.shade700 : Colors.grey;
    } else {
      return index < 1 ? Colors.yellow.shade700 : Colors.grey;
    }
  }
}

class BookmarkButton extends StatefulWidget{
  const BookmarkButton({Key? key}): super (key:key);
  
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
  
}

class _BookmarkButtonState extends State<BookmarkButton>{
  bool isBookmark = false;
  
  @override
  Widget build(BuildContext context){
    return IconButton(
        icon: Icon(isBookmark ? Icons.bookmark_added : Icons.bookmark_add,
        size: 22, color: Colors.white),
        onPressed: (){
          setState(() {
            isBookmark = !isBookmark;
          });
        },
    );
  }
}

class View extends StatefulWidget {
  final String description;
  final List<String> todoList;

  View({required this.description, required this.todoList});

  @override
  _ViewState createState() => _ViewState();

}

class _ViewState extends State<View>{
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Text(_currentPage == 1 ? 'List Todo'  : 'Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding( // Add padding here
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    widget.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.all(20.0),
                      itemCount: widget.todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('${index + 1}. ${widget.todoList[index]}', style: TextStyle(fontSize: 16),);
                    }),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ));
              },
            ),
            ),
          ],
        ),
    );
  }
}

class ViewWeb extends StatefulWidget {
  final String description;
  final List<String> todoList;

  ViewWeb({required this.description, required this.todoList});

  @override
  _ViewStateWeb createState() => _ViewStateWeb();
}

class _ViewStateWeb extends State<ViewWeb> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            _currentPage == 1 ? 'List Todo' : 'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: <Widget>[
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.description,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(20.0),
                    itemCount: widget.todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        '${index + 1}. ${widget.todoList[index]}',
                        style: TextStyle(fontSize: 16),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
