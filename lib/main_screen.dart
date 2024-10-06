import 'package:flutter/material.dart';
import 'package:task_todo/detail_screen.dart';
import 'package:task_todo/model/ProjectTask.dart';
import 'package:percent_indicator/percent_indicator.dart';


class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}): super(key:key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Project Task'),
        ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 450) {
            return ProjectList(); //
          } else if (constraints.maxWidth > 450 && constraints.maxWidth <= 650) {
            return ProjectGrid(gridCount: 3);
          } else if (constraints.maxWidth > 651 && constraints.maxWidth <= 950) {
            return ProjectGrid(gridCount: 4);
          } else if (constraints.maxWidth > 951 && constraints.maxWidth <= 1250) {
            return ProjectGrid(gridCount: 5);
          } else {
            return ProjectGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}
class ProjectList extends StatelessWidget{
  const ProjectList({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (context, index){
        final ProjectTask task = ProjectTaskList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(task: task);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 6.0,
                      percent: 1.0,
                      center: Text(task.progress ),
                      progressColor: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            task.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(task.project,
                            style: const TextStyle(color: Colors.black45),)
                        ],
                      )

                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: ProjectTaskList.length,
    );
  }
}

class ProjectGrid extends StatelessWidget {
  final int gridCount;

  const ProjectGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: ProjectTaskList.map((task) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(task: task);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularPercentIndicator(
                          radius: 30.0,
                          lineWidth: 6.0,
                          percent: 1.0,
                          center: Text(task.progress ),
                          progressColor: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        task.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        task.project,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
      ),
    );
  }
}