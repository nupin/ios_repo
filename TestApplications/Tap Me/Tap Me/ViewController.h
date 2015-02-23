//
//  ViewController.h
//  Tap Me
//
//  Created by Nupin Pillai on 02/02/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController{
    int pressCount;
    int seconds;
    NSTimer *timer;
    
    //Addding audio sounds
    AVAudioPlayer *buttonBeep ;
    AVAudioPlayer *secondBeep ;
    AVAudioPlayer *backgroundMusic ;
    
}

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *tapMeButton;

@end

