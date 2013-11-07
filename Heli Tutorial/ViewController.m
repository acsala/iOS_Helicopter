//
//  ViewController.m
//  Heli Tutorial
//
//  Created by Attila Csala on 11/6/13.
//  Copyright (c) 2013 Attila Csala. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)Collision{
    
    //if helicopter and obsticle touch then we run EndGame
    if (CGRectIntersectsRect(Heli.frame, Obstacle.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Obstacle2.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom1.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom2.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom3.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom4.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom5.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom6.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Bottom7.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top1.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top2.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top3.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top4.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top5.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top6.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Heli.frame, Top7.frame)) {
        [self EndGame];
    }
    
    //if helicopter touch down green line at the beginning
    if (Heli.center.y > 270) {
        [self EndGame];
    }
    
    if (Heli.center.y < 55) {
        [self EndGame];
    }
    
}

-(void)EndGame{
    
    //check if we brake highscore
    if (ScoreNumber > HighScore) {
        HighScore = ScoreNumber;
        
        //take the integer highscore and save as HighScoreSaved
        [[NSUserDefaults standardUserDefaults] setInteger:HighScore forKey:@"HighScoreSaved"];
    }
    
    Heli.hidden = YES;
    //stop motion
    [timer invalidate];
    [Scorer invalidate];
    
    //run a new game after a five second pause
    [self performSelector:@selector(NewGame) withObject:Nil afterDelay:5];
}

-(void)NewGame{
    
    Bottom1.hidden = YES;
    Bottom2.hidden = YES;
    Bottom3.hidden = YES;
    Bottom4.hidden = YES;
    Bottom5.hidden = YES;
    Bottom6.hidden = YES;
    Bottom7.hidden = YES;
    
    Top1.hidden = YES;
    Top2.hidden = YES;
    Top3.hidden = YES;
    Top4.hidden = YES;
    Top5.hidden = YES;
    Top6.hidden = YES;
    Top7.hidden = YES;
    
    Obstacle.hidden = YES;
    Obstacle2.hidden = YES;
    
    Intro1.hidden = NO;
    Intro2.hidden = NO;
    Intro3.hidden = NO;
    
    Heli.hidden = NO;
    Heli.center = CGPointMake(42, 136);
    Heli.image = [UIImage imageNamed:@"HeliUp.png"];
    
    Start = YES;
    
    ScoreNumber = 0;
    Score.text = [NSString stringWithFormat:@"Score: 0"];
    Intro3.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
    
}

-(void)HeliMove{
    
    //run Collision to check if there is collision
    [self Collision];
    
    Heli.center = CGPointMake(Heli.center.x, Heli.center.y + Y);
    
    Obstacle.center = CGPointMake(Obstacle.center.x - 10, Obstacle.center.y);
    Obstacle2.center = CGPointMake(Obstacle2.center.x - 10, Obstacle2.center.y);
    
    Bottom1.center = CGPointMake(Bottom1.center.x - 10, Bottom1.center.y);
    Bottom2.center = CGPointMake(Bottom2.center.x - 10, Bottom2.center.y);
    Bottom3.center = CGPointMake(Bottom3.center.x - 10, Bottom3.center.y);
    Bottom4.center = CGPointMake(Bottom4.center.x - 10, Bottom4.center.y);
    Bottom5.center = CGPointMake(Bottom5.center.x - 10, Bottom5.center.y);
    Bottom6.center = CGPointMake(Bottom6.center.x - 10, Bottom6.center.y);
    Bottom7.center = CGPointMake(Bottom7.center.x - 10, Bottom7.center.y);
    
    Top1.center = CGPointMake(Top1.center.x - 10, Top1.center.y);
    Top2.center = CGPointMake(Top2.center.x - 10, Top2.center.y);
    Top3.center = CGPointMake(Top3.center.x - 10, Top3.center.y);
    Top4.center = CGPointMake(Top4.center.x - 10, Top4.center.y);
    Top5.center = CGPointMake(Top5.center.x - 10, Top5.center.y);
    Top6.center = CGPointMake(Top6.center.x - 10, Top6.center.y);
    Top7.center = CGPointMake(Top7.center.x - 10, Top7.center.y);
    
    if (Obstacle.center.x < 0) {
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 110;
        
        Obstacle.center = CGPointMake(510, RandomPosition);
    }
    
    if (Obstacle2.center.x < 0) {
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 110;
        
        Obstacle2.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top1.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top1.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom1.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top2.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top2.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom2.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top3.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top3.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom3.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top4.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top4.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom4.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top5.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top5.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom5.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top6.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top6.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom6.center = CGPointMake(510, RandomPosition);
    }
    
    if (Top7.center.x < -30) {
        RandomPosition = arc4random() %55;
        Top7.center = CGPointMake(510, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom7.center = CGPointMake(510, RandomPosition);
    }
}

-(void)Scoring{
    
    ScoreNumber = ScoreNumber + 1;
    
    Score.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
}


//runt the code if screen is touched
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (Start == YES) {
        
        //hide labels
        Intro1.hidden = YES;
        Intro2.hidden = YES;
        Intro3.hidden = YES;
        
        //set up timer
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(HeliMove) userInfo:Nil repeats:YES];
        
        //start the timer run every one second the method Scoring
        Scorer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Scoring) userInfo:Nil repeats:YES];
        
        Start = NO;
        
        Bottom1.hidden = NO;
        Bottom2.hidden = NO;
        Bottom3.hidden = NO;
        Bottom4.hidden = NO;
        Bottom5.hidden = NO;
        Bottom6.hidden = NO;
        Bottom7.hidden = NO;
        
        Top1.hidden = NO;
        Top2.hidden = NO;
        Top3.hidden = NO;
        Top4.hidden = NO;
        Top5.hidden = NO;
        Top6.hidden = NO;
        Top7.hidden = NO;
        
        Obstacle.hidden = NO;
        Obstacle2.hidden = NO;
        
        //get a random value between 0 and 75
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 110;
        
        Obstacle.center = CGPointMake(570, RandomPosition);
        
        //place obstacle2
        RandomPosition = arc4random() %75;
        RandomPosition = RandomPosition + 110;
        
        Obstacle2.center = CGPointMake(855, RandomPosition);
        
        //place top and bottom obstacles
        
        RandomPosition = arc4random() %55;
        Top1.center = CGPointMake(560, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom1.center = CGPointMake(560, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top2.center = CGPointMake(640, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom2.center = CGPointMake(640, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top3.center = CGPointMake(720, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom3.center = CGPointMake(720, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top4.center = CGPointMake(800, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom4.center = CGPointMake(800, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top5.center = CGPointMake(880, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom5.center = CGPointMake(880, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top6.center = CGPointMake(960, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom6.center = CGPointMake(960, RandomPosition);
        
        RandomPosition = arc4random() %55;
        Top7.center = CGPointMake(1040, RandomPosition);
        RandomPosition = RandomPosition + 265;
        Bottom7.center = CGPointMake(1040, RandomPosition);
        
    }
    
    Y = -7;
    Heli.image = [UIImage imageNamed:@"HeliUp.png"];
    
}

//if we stop touching the screen
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    Y = 7;
    Heli.image = [UIImage imageNamed:@"HeliDown.png"];
}

- (void)viewDidLoad{
    Start = YES;
    
    Bottom1.hidden = YES;
    Bottom2.hidden = YES;
    Bottom3.hidden = YES;
    Bottom4.hidden = YES;
    Bottom5.hidden = YES;
    Bottom6.hidden = YES;
    Bottom7.hidden = YES;
    
    Top1.hidden = YES;
    Top2.hidden = YES;
    Top3.hidden = YES;
    Top4.hidden = YES;
    Top5.hidden = YES;
    Top6.hidden = YES;
    Top7.hidden = YES;
    
    Obstacle.hidden = YES;
    Obstacle2.hidden = YES;
    
    //take the integer, called HighScore, set it to whatever value we have saved under HighScoreSaved
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    Intro3.text = [NSString stringWithFormat:@"High Score: %i", HighScore];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
