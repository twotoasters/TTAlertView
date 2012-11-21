# TTAlertView
TTAlertView is a drop-in replacement for UIAlertView that allows the developer to customize the presentation of an alert. TTAlertView uses the familiar interface of UIAlertView, so you don’t have to worry about rewriting any of your code – just drop it in, add some assets, and -bam!- you have a unique, customized alert view for your app!

## Installation ##

If you're using git, you can add TTAlertView as a submodule to your project. Otherwise, you can simply download the latest source from the master branch here on github. 

Once you've obtained the TTAlertView project, simply add TTAlertView.h + TTAlertView.m to your xcode project and `#include TTAlertView.h` in the files you want to use TTAlertView. Now you're set to go!

## Usage ##

Using TTAlertView is simple. TTAlertView uses the familiar `initWithTitle:​message:​delegate:​cancelButtonTitle:​otherButtonTitles:`  and `show` methods to create and display your alert view. From there TTAlertView handles laying out and animating the view. 

Lets see some code:

```objective-c A Simple TTAlertView Example

- (void)simpleAlert
{
    TTAlertView *alert = [[TTAlertView alloc] initWithTitle:@"A Simple TTAlertView" 
                                                    message:@"... with the default layout!" 
                                                   delegate:self 
                                          cancelButtonTitle:@"Dismiss" 
                                          otherButtonTitles:nil];
    [alert show];
}

```

... which gives you this:

![A real simple TTAlertView](http://f.cl.ly/items/0s101b290u2D463J3D0n/Screen%20Shot%202012-10-19%20at%2011.23.32%20AM.png)

This is just a simple example of TTAlertView's use. You can read more about using TTAlertView at [ToastMo's blog post on TTAlertView.](#http://toastmo.com/blog/2012/11/21/introducing-ttalertview/)

## License

MIT: [http://twotoasters.mit-license.org](http://twotoasters.mit-license.org)