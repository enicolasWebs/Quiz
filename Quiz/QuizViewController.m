//
//  ViewController.m
//  Quiz
//
//  Created by Ernald on 5/7/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "QuizViewController.h"

@interface KeyValuePair : NSObject
@property (nonatomic) id key;
@property (nonatomic) id value;
- (instancetype) initWithKey: (id) key andValue: (id) value;
@end

@implementation KeyValuePair
- (instancetype) initWithKey: (id) key andValue: (id) value
{
    self = [super init];
    
    _key = key;
    _value = value;
    
    return self;
}
@end

@interface QuizViewController ()
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic, strong) IBOutlet UIButton *getQuestionButton;
@property (nonatomic, strong) IBOutlet UIButton *getAnswerButton;

@property (nonatomic) int currentQuestionIndx;
@property (nonatomic, copy) NSArray *questionsAndAnswers;
@property KeyValuePair * curKVP;
@end

@implementation QuizViewController


- (void) awakeFromNib
{
    _questionsAndAnswers = @[[[KeyValuePair alloc] initWithKey:@"From what is cognax made?" andValue:@"Grapes"],
                                 [[KeyValuePair alloc] initWithKey:@"What is 7+7?" andValue:@"14"],
                                 [[KeyValuePair alloc] initWithKey:@"What is the capital of Vermont?" andValue:@"Montpelier"]];
    
    _currentQuestionIndx = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_getAnswerButton setTitle:@"Show Answer" forState:UIControlStateNormal];
    [_getQuestionButton setTitle:@"Show Question" forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) showQuestion: (id) sender
{
    _currentQuestionIndx++;
    
    if(_currentQuestionIndx == [_questionsAndAnswers count])
    {
        _currentQuestionIndx = 0;
    }
    
    _curKVP = _questionsAndAnswers[_currentQuestionIndx];
    _questionLabel.text = _curKVP.key;
    _answerLabel.text = @"???";
}

- (IBAction) showAnswer: (id) sender
{
    if(_curKVP == nil)
    {
        return;
    }
    
    _answerLabel.text = _curKVP.value;
}

@end
