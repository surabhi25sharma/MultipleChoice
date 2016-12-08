//
//  ViewController.m
//  trial
//
//  Created by Abhishek on 06/12/16.
//  Copyright © 2016 Dexinnovations. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;  //Queston Label

@property (weak, nonatomic) IBOutlet UILabel *option1;   // Four options label
@property (weak, nonatomic) IBOutlet UILabel *option2;
@property (weak, nonatomic) IBOutlet UILabel *option3;
@property (weak, nonatomic) IBOutlet UILabel *option4;

@property (weak, nonatomic) IBOutlet UIButton *op1btn;   // Options selection button
@property (weak, nonatomic) IBOutlet UIButton *op2btn;
@property (weak, nonatomic) IBOutlet UIButton *op3btn;
@property (weak, nonatomic) IBOutlet UIButton *op4btn;

@end

@implementation ViewController
{
    NSArray *questioinsArray;  // Array to store all questions.
    NSArray *optionsArray;     // array to store all answers.
    NSInteger currentQuestion,totalQuestions,selected; // integer required for current question total question and selected  question
    NSMutableDictionary *answers; //dictionay to save all the answers from the user
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentQuestion=0; //let current question be 0 so we get the  questionArray index value
    
    answers=[[NSMutableDictionary alloc]init]; // alloc and init dictionary for use.

    //sample questions and answers
    
    questioinsArray=@[@"1. Question one",@"2. Question two",@"3. Question three",@"4. Question four"];
    optionsArray=@[@[@"1 option 1",@"1 option 2",@"1 option 3",@"1 option 4"],
                   @[@"2 option 1",@"2 option 2",@"2 option 3",@"2 option 4"],
                   @[@"3 option 1",@"3 option 2",@"3 option 3",@"3 option 4"],
                   @[@"4 option 1",@"4 option 2",@"4 option 3",@"4 option 4"]];
    
    //this for loop creates an answers dictionary with all nill value for all the questions
    for (int i=1; i<=questioinsArray.count; i++)
    {
        [answers setObject:@"" forKey:[NSString stringWithFormat:@"%d",i]];
    }
    NSLog(@"%@",answers);
    //nslog to see the initial answers set
    
    totalQuestions=[questioinsArray count]; //total number of questions to stop next button from incrementing greater then the number of questions
    
    //calls the method to display questions and answer using currentQuestion =0
                             // first quesstion                                  // first options array
    [self question:[questioinsArray objectAtIndex:currentQuestion] options:[optionsArray objectAtIndex:currentQuestion]];
    
}
#pragma This method set the question and options
-(void)question:(NSString *)question options:(NSArray*)options
{
    _questionLabel.text=question;
    _option1.text=[options objectAtIndex:0];
    _option2.text=[options objectAtIndex:1];
    _option3.text=[options objectAtIndex:2];
    _option4.text=[options objectAtIndex:3];
    
}

#pragma Next Button action
- (IBAction)NextQuestion:(id)sender
{
    currentQuestion++;
    if(currentQuestion<totalQuestions)
    {
            [self question:[questioinsArray objectAtIndex:currentQuestion] options:[optionsArray objectAtIndex:currentQuestion]];
            [self clearSelection];
    }
    else
    {
        currentQuestion=totalQuestions-1;
    }
    
}

#pragma Previous button action

- (IBAction)PreviousQuestion:(id)sender
{
    currentQuestion--;
    if (currentQuestion>=0)
    {
        [self question:[questioinsArray objectAtIndex:currentQuestion] options:[optionsArray objectAtIndex:currentQuestion]];
        [self clearSelection];
    }
    else
    {
        currentQuestion=0;
    }
    
}

#pragma This method clears all the options selected
-(void)clearSelection{
    _op1btn.backgroundColor=[UIColor whiteColor];
    _op2btn.backgroundColor=[UIColor whiteColor];
    _op3btn.backgroundColor=[UIColor whiteColor];
    _op4btn.backgroundColor=[UIColor whiteColor];
}


#pragma THis method handles the color for user selection and answer
- (IBAction)optionSelection:(id)sender {
    
    switch ([sender tag]) {
        case 1:
            _op1btn.backgroundColor=[UIColor blueColor]; //set color
            _op2btn.backgroundColor=[UIColor whiteColor];
            _op3btn.backgroundColor=[UIColor whiteColor];
            _op4btn.backgroundColor=[UIColor whiteColor];
            [answers setObject:@"1" forKey:[NSString stringWithFormat:@"%ld",currentQuestion+1]]; //save the user selection

            break;
        case 2:
            _op1btn.backgroundColor=[UIColor whiteColor];
            _op2btn.backgroundColor=[UIColor blueColor]; //set color
            _op3btn.backgroundColor=[UIColor whiteColor];
            _op4btn.backgroundColor=[UIColor whiteColor];
            [answers setObject:@"2" forKey:[NSString stringWithFormat:@"%ld",currentQuestion+1]];  //save the user selection

            break;
        case 3:
            _op1btn.backgroundColor=[UIColor whiteColor];
            _op2btn.backgroundColor=[UIColor whiteColor];
            _op3btn.backgroundColor=[UIColor blueColor]; //set color
            _op4btn.backgroundColor=[UIColor whiteColor];
            [answers setObject:@"3" forKey:[NSString stringWithFormat:@"%ld",currentQuestion+1]];  //save the user selection

            break;
        case 4:
            _op1btn.backgroundColor=[UIColor whiteColor];
            _op2btn.backgroundColor=[UIColor whiteColor];
            _op3btn.backgroundColor=[UIColor whiteColor];
            _op4btn.backgroundColor=[UIColor blueColor];  //set color
            [answers setObject:@"4" forKey:[NSString stringWithFormat:@"%ld",currentQuestion+1]];  //save the user selection

            break;
    }
    NSLog(@"%@",answers); //you can see the answer set to the respective questions
}

// YO Macha happy coding !!!




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
