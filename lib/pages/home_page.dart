import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_practice25_instagram/models/posts.dart';
import 'package:flutter_practice25_instagram/models/stories.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLiked = false;
  List<Stories> _storiesList = [
    Stories(imagePath: "assets/images/face5.jpg", username: "Matthew"),
    Stories(imagePath: "assets/images/face10.jpg", username: "William"),
    Stories(imagePath: "assets/images/face7.jpg", username: "Jessica"),
    Stories(imagePath: "assets/images/face9.jpg", username: "Gregory"),
    Stories(imagePath: "assets/images/face1.jpg", username: "Rebecca"),
    Stories(imagePath: "assets/images/face8.jpg", username: "Richard"),
    Stories(imagePath: "assets/images/face4.jpg", username: "Dorothy"),
    Stories(imagePath: "assets/images/face2.jpg", username: "Francis"),
  ];

  List<Posts> postsList = [
    Posts(
        postPath: "assets/images/post7.jpg",
        userImage: "assets/images/face7.jpg",
        username: "Jessica",
        timeOfUpload: "July 16, 2024",
        numOfLikes: "685", index: 0),
    Posts(
        postPath: "assets/images/post1.jpg",
        userImage: "assets/images/face10.jpg",
        username: "William",
        timeOfUpload: "September 30, 2023",
        numOfLikes: "2239", index: 1),
    Posts(
        postPath: "assets/images/post3.jpg",
        userImage: "assets/images/face1.jpg",
        username: "Rebecca",
        timeOfUpload: "June 15, 2024",
        numOfLikes: "981", index: 2),
    Posts(
        postPath: "assets/images/post8.jpg",
        userImage: "assets/images/face8.jpg",
        username: "Richard",
        timeOfUpload: "March 27, 2024",
        numOfLikes: "727", index: 3),
    Posts(
        postPath: "assets/images/post5.jpg",
        userImage: "assets/images/face10.jpg",
        username: "Francis",
        timeOfUpload: "December 27, 2023",
        numOfLikes: "1502", index: 4),
  ];

  int checkPostIndex(String name) {
    for (int i = 0; i < postsList.length; i++) {
      if (postsList[i].username == name) {
        return i;
      }
    }
    return 0;
  }

  Widget storyMaker(Stories story) {
    return Column(children: [
      Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(
          left: 12,
          right: 13,
        ),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purple[800]!, width: 3)),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(story.imagePath), fit: BoxFit.cover)),
        ),
      ),
      SizedBox(
        height: 9,
      ),
      Container(
        margin: EdgeInsets.only(
          left: 12,
          right: 13,
        ),
        child: Text(
          story.username,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      )
    ]);
  }

  Widget _postMaker(Posts post) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 8, bottom: 11),
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          // User image, username and icon part
          Container(
            padding: EdgeInsets.only(
              left: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(post.userImage),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      post.username,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      size: 26,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 13,
          ),
          // Post Image Part
          Container(
              width: double.infinity,
              height: 270,
              child: FadeInImage(
                placeholder: AssetImage("assets/images/placeholder.jpg"),
                image: AssetImage(post.postPath),
                fit: BoxFit.cover,
              )),
          // Icons Part
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            int index = checkPostIndex(post.username);
                            if(index == post.index){
                              _isLiked = !_isLiked;
                            }
                          });
                        },
                        icon: Icon(
                          _isLiked ? Icons.favorite : FeatherIcons.heart,
                          size: _isLiked ? 28 : 24,
                          color: _isLiked ? Colors.red[900] : Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.messageCircle,
                          size: 24,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.send,
                          size: 24,
                        ))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                      size: 29,
                    ))
              ],
            ),
          ),
          // Bottom Info Part
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Liked by ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Francis, Dorothy, Rebecca, Richard, Jessica ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: "and ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "${post.numOfLikes} others",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ])),
          ),
          SizedBox(
            height: 5,
          ),
          // Date Part
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                post.timeOfUpload,
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Stories Part
          Container(
            padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
            height: 170,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(11, 0, 11, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stories",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      Text(
                        "Watch all",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _storiesList.map((e) => storyMaker(e)).toList(),
                  ),
                )
              ],
            ),
          ),

          // Posts Part
          Column(
            children: postsList.map((e) => _postMaker(e)).toList(),
          )
        ],
      ),
    );
  }
}
