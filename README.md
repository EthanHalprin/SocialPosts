# SocialPosts

![ScreenShot Social](/ScreenShot.png)

GENERAL

Piece of code to show how to upload a post for Facebook or Twitter using Social framework. As for the other two other networks, Sina Weibo and Tencent Weibo, they are currently produce an empty ViewController, but I left code for future usage just in case.

HOW TO USE

Enter your text for the post in the TextView (see `ScreenShot` file). If you want to attach an image from Photo Assets, tap on the image view square to upload a picture from your assets. Finally, press on one of the social network icons for posting. It will not send the post immediately, but will open a SLComposeViewController showing your picked text and picture (if you chose to load one).
If you are not hooked on Settings to the social network you have picked, SLComposeViewController will automatically prompts a message asking you to connect.
More stuff to find in code : how to pick an image from assets and how to dismiss keyboard after typing in TextView.

IMPORTANT NOTES

Please Mind in this project:

* Code I have written is free as far as I'm concerned. You may copy, change, distribute
  for any purpose.
  HOWEVER, Images are not mine. They are under Creative Commons Attribution 4.0 International License.
  It's also mostly free, but please check it out if you use images!

  license
  https://creativecommons.org/licenses/by/4.0/

  instructions
  https://creativecommons.org/choose/results-one?license_code=by&amp;jurisdiction=&amp;version=4.0&amp;lang=en

* Credits for images :

  Facebook and Twitter Images by Jurgen Appelo
  https://www.flickr.com/photos/jurgenappelo/

  Sina Weibo Image by bfishadow
  https://www.flickr.com/photos/bfishadow/

  Tencent Image by ZFreet CHeung
  https://www.iconfinder.com/ZFreet

  They are all under the Creative Commons Attribution 4.0 International License mentioned above.
  For more details please see `Credits` file on Resources directory.

* ImagePicker - since we access user's assets as we upload image, I have added
  an entry for it in the plist, so user could give his/her approval. It's a must.
  See in plist "Privacy - Photo Library Usage Description".

_______________________________________________________________________________________
This work is licensed under a Creative Commons Attribution 4.0 International License.
https://creativecommons.org/licenses/by/4.0/

