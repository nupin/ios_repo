//
//  ViewController.m
//  Tap Me
//
//  Created by Nupin Pillai on 02/02/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //loading audio files
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    _scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    _timeLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    [self handleTime];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapme:(id)sender {
    
    pressCount++ ;
    _scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)pressCount];
    [buttonBeep play];
    
}

- (void)handleTime {
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
    
    seconds = 10 ;
    pressCount = 0 ;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(substractTime) userInfo:nil repeats:YES];
    
}

- (void)substractTime{
    seconds--;
    _timeLabel.text = [NSString stringWithFormat: @"Time : %ld",(long)seconds];
    
    [secondBeep play];
    
    if( seconds == 0)
    {
        [timer invalidate];
        [_tapMeButton setEnabled:NO];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You have scored %i",pressCount] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles: nil];
        
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [_tapMeButton setEnabled:YES];
    
    _scoreLabel.text = @"Score";
    [self handleTime];
}

-(AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *) fileName type:(NSString *)type{

    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error ;
    
    AVAudioPlayer *audioPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    return audioPlayer;
}
@end
