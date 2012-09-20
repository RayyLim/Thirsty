//
//  SharedModel.m
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "SharedModel.h"

#import "RobotKit/RobotKit.h"

#import "RobotUIKit/RobotUIKit.h"

#define TOTAL_PACKET_COUNT 200
#define PACKET_COUNT_THRESHOLD 50
#define SHAKE_THRESHOLD 4

@implementation SharedModel {
    NSString *shakeToStartAgainMessage;
    NSString *passAndShakeMessage;
    NSString *everybodyMessage1;
    NSString *everybodyMessage2;
    NSString *everybodyMessage3;
    NSString *everybodyMessage4;
    int everybodyCount;
        int  packetCounter;
}

@synthesize colorArray, bottomMessage;

+ (id)sharedModel {
    static SharedModel *sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}

- (id)init {
    if (self = [super init]) {
        shakeToStartAgainMessage = @"Shake to start again";
        passAndShakeMessage = @"Pass and shake";
        self.bottomMessage = passAndShakeMessage;
        everybodyCount = 0;
        

        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
            plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                              propertyListFromData:plistXML
                                              mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                              format:&format
                                              errorDescription:&errorDesc];
        if (!temp) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        everybodyMessage1 = [[temp objectForKey:@"rule_everybody"] copy];
        everybodyMessage2 = [[temp objectForKey:@"rule_everybody2"] copy];
        everybodyMessage3 = [[temp objectForKey:@"rule_everybody3"] copy];
        everybodyMessage4 = [NSString stringWithFormat:@"Game Over\nTippsy Yet?"];
        
        self.colorArray = [NSArray arrayWithObjects:
                      
                      [[TippsyRule alloc] initWithRule:@"message_everybody":@"messagebg_everybody":@"color_yellow":255:242:0:[temp objectForKey:@"rule_everybody"]:@""],
                      [[TippsyRule alloc] initWithRule:@"message_categories":@"messagebg_categories":@"color_yellowgreen":226:245:76:[temp objectForKey:@"rule_categories"]:[temp objectForKey:@"description_categories"]],
                           [[TippsyRule alloc] initWithRule:@"message_chug":@"messagebg_chug":@"color_magenta":236:0:140:[temp objectForKey:@"rule_chug"]:[temp objectForKey:@"description_chug"]],
                           [[TippsyRule alloc] initWithRule:@"message_floor":@"messagebg_floor":@"color_green":0:166:81:[temp objectForKey:@"rule_floor"]:[temp objectForKey:@"description_floor"]],
                           [[TippsyRule alloc] initWithRule:@"message_girls":@"messagebg_girls":@"color_pink":226:138:175:[temp objectForKey:@"rule_girls"]:[temp objectForKey:@"description_girls"]],
                           [[TippsyRule alloc] initWithRule:@"message_guys":@"messagebg_guys":@"color_blue":28:117:118:[temp objectForKey:@"rule_guys"]:[temp objectForKey:@"description_guys"]],
                           [[TippsyRule alloc] initWithRule:@"message_left":@"messagebg_left":@"color_lightblue":128:212:252:[temp objectForKey:@"rule_left"]:[temp objectForKey:@"description_left"]],
                           [[TippsyRule alloc] initWithRule:@"message_questionmaster":@"messagebg_questionmaster":@"color_bronze":209:98:24:[temp objectForKey:@"rule_questionmaster"]:[temp objectForKey:@"description_questionmaster"]],
                           [[TippsyRule alloc] initWithRule:@"message_rhyme":@"messagebg_rhyme":@"color_purple":101:44:144:[temp objectForKey:@"rule_rhyme"]:[temp objectForKey:@"description_rhyme"]],
                           [[TippsyRule alloc] initWithRule:@"message_right":@"messagebg_right":@"color_teal":16:150:121:[temp objectForKey:@"rule_right"]:[temp objectForKey:@"description_right"]],
                           [[TippsyRule alloc] initWithRule:@"message_sky":@"messagebg_sky":@"color_cyan":103:215:249:[temp objectForKey:@"rule_sky"]:[temp objectForKey:@"description_sky"]],
                           [[TippsyRule alloc] initWithRule:@"message_thumbwar":@"messagebg_thumbwar":@"color_red":237:28:36:[temp objectForKey:@"rule_thumbwar"]:[temp objectForKey:@"description_thumbwar"]],
                           [[TippsyRule alloc] initWithRule:@"message_thumbking":@"messagebg_thumbking":@"color_silver":209:210:212:[temp objectForKey:@"rule_thumbking"]:[temp objectForKey:@"description_thumbking"]],
                           [[TippsyRule alloc] initWithRule:@"message_vikingking":@"messagebg_vikingking":@"color_gold":251:227:150:[temp objectForKey:@"rule_vikingking"]:[temp objectForKey:@"description_vikingking"]],
                           [[TippsyRule alloc] initWithRule:@"message_waterfall":@"messagebg_waterfall":@"color_orange":247:148:30:[temp objectForKey:@"rule_waterfall"]:[temp objectForKey:@"description_waterfall"]],
                      nil];
        
    }
    return self;
}

- (TippsyRule *)getRule:(int) position {
    TippsyRule *tippyrule = [self.colorArray objectAtIndex:position];
    
    if(position == 0)
    {
    
    switch (everybodyCount)
    {
        case 0:
            tippyrule.drinkingRule = everybodyMessage1;
            self.bottomMessage = passAndShakeMessage;
            break;
        case 1:
            tippyrule.drinkingRule = everybodyMessage2;

            self.bottomMessage = passAndShakeMessage;
            break;
        case 2:
            tippyrule.drinkingRule = everybodyMessage3;

            self.bottomMessage = passAndShakeMessage;
            break;
        case 3:
            tippyrule.drinkingRule = [NSString stringWithFormat:@"Game Over\nTippsy Yet?"];

            self.bottomMessage = shakeToStartAgainMessage;
            break;
    }
        
everybodyCount = (everybodyCount + 1) % 4;
}
    else{
        self.bottomMessage = passAndShakeMessage;
    }
//    self.bottomMessage = shakeToStartAgainMessage;
    return tippyrule;
}

- (void) registerForAppLifecycleNotifications
{
    /*Register for application lifecycle notifications so we known when to connect and disconnect from the robot*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    
    /*Only start the blinking loop when the view loads*/
    robotOnline = NO;
}

- (void)stopListeningForShake {
    ////First turn off stabilization so the drive mechanism does not move.
    [RKStabilizationCommand sendCommandWithState:RKStabilizationStateOn];
    
    
    // Turn off data streaming
    [RKSetDataStreamingCommand sendCommandWithSampleRateDivisor:0
                                                   packetFrames:0
                                                     sensorMask:RKDataStreamingMaskOff
                                                    packetCount:0];
    // Unregister for async data packets
    [[RKDeviceMessenger sharedMessenger] removeDataStreamingObserver:self];
}

-(void)appWillResignActive:(NSNotification*)notification {
    /*When the application is entering the background we need to close the connection to the robot*/
    [[NSNotificationCenter defaultCenter] removeObserver:self name:RKDeviceConnectionOnlineNotification object:nil];
    
    [self stopListeningForShake];
    
    [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:0.0];
    [self stop];
    [[RKRobotProvider sharedRobotProvider] closeRobotConnection];
}

-(void)appDidBecomeActive:(NSNotification*)notification {
    /*When the application becomes active after entering the background we try to connect to the robot*/
    [self setupRobotConnection];
}

- (void)startListeningForShake {
    // Start streaming sensor data
    ////First turn off stabilization so the drive mechanism does not move.
    [RKStabilizationCommand sendCommandWithState:RKStabilizationStateOff];
    
    [self sendSetDataStreamingCommand];
    
    ////Register for asynchronise data streaming packets
    [[RKDeviceMessenger sharedMessenger] addDataStreamingObserver:self selector:@selector(handleAsyncData:)];
}

- (void)handleRobotOnline {
    /*The robot is now online, we can begin sending commands*/
    if(!robotOnline) {
        /*Only start the blinking loop once*/
//        [self toggleLED];
//        [self spin];
        
//        [self startListeningForShake];
    }
    robotOnline = YES;
}

- (void)toggleLED {
    /*Toggle the LED on and off*/
    if (ledON) {
        ledON = NO;
        [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:0.0];
    } else {
        ledON = YES;
        [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:1.0];
    }
    [self performSelector:@selector(toggleLED) withObject:nil afterDelay:0.5];
}

-(void)setupRobotConnection {
    /*Try to connect to the robot*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRobotOnline) name:RKDeviceConnectionOnlineNotification object:nil];
    if ([[RKRobotProvider sharedRobotProvider] isRobotUnderControl]) {
        [[RKRobotProvider sharedRobotProvider] openRobotConnection];
    }
}

- (void)setLED:(int) red:(int) green: (int)blue
{
    
    //    [RKRGBLEDOutputCommand sendCommandWithRed:1.0 green:0.0 blue:0.0];
    [RKRGBLEDOutputCommand sendCommandWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0)];
}

- (void)spin
{
    [RKStabilizationCommand sendCommandWithState:(RKStabilizationStateOff)]; //Raw motors need Stabilization turned off

    int spin = 255;
    for(int i = spin; i > 150; i--)
    {
        [RKRawMotorValuesCommand sendCommandWithLeftMode:1.0 leftPower:i rightMode:2.0 rightPower:i];

        [NSThread sleepForTimeInterval:.030];

    }
    


    [self stop];
}

- (void)stop
{
    [RKRawMotorValuesCommand sendCommandWithLeftMode:1.0 leftPower:0 rightMode:1.0 rightPower:0];
    [RKStabilizationCommand sendCommandWithState:(RKStabilizationStateOn)];    //Turn stabilization back on stopping the raw motors
}


-(void)sendSetDataStreamingCommand {
    
    // Requesting the Accelerometer X, Y, and Z filtered (in Gs)
    //            the IMU Angles roll, pitch, and yaw (in degrees)
    //            the Quaternion data q0, q1, q2, and q3 (in 1/10000) of a Q
    RKDataStreamingMask mask =  RKDataStreamingMaskAccelerometerFilteredAll |
    RKDataStreamingMaskIMUAnglesFilteredAll   |
    RKDataStreamingMaskQuaternionAll;
    
    // Note: If your ball has Firmware < 1.20 then these Quaternions
    //       will simply show up as zeros.
    
    // Sphero samples this data at 400 Hz.  The divisor sets the sample
    // rate you want it to store frames of data.  In this case 400Hz/40 = 10Hz
    uint16_t divisor = 40;
    
    // Packet frames is the number of frames Sphero will store before it sends
    // an async data packet to the iOS device
    uint16_t packetFrames = 1;
    
    // Count is the number of async data packets Sphero will send you before
    // it stops.  You want to register for a finite count and then send the command
    // again once you approach the limit.  Otherwise data streaming may be left
    // on when your app crashes, putting Sphero in a bad state.
    uint8_t count = TOTAL_PACKET_COUNT;
    
    // Reset finite packet counter
    packetCounter = 0;
    
    // Send command to Sphero
    [RKSetDataStreamingCommand sendCommandWithSampleRateDivisor:divisor
                                                   packetFrames:packetFrames
                                                     sensorMask:mask
                                                    packetCount:count];
    
}

- (void)handleAsyncData:(RKDeviceAsyncData *)asyncData
{
    // Need to check which type of async data is received as this method will be called for
    // data streaming packets and sleep notification packets. We are going to ingnore the sleep
    // notifications.
    if ([asyncData isKindOfClass:[RKDeviceSensorsAsyncData class]]) {
        
        // If we are getting close to packet limit, request more
        packetCounter++;
        if( packetCounter > (TOTAL_PACKET_COUNT-PACKET_COUNT_THRESHOLD)) {
            [self sendSetDataStreamingCommand];
        }
        
        // Received sensor data, so display it to the user.
        RKDeviceSensorsAsyncData *sensorsAsyncData = (RKDeviceSensorsAsyncData *)asyncData;
        RKDeviceSensorsData *sensorsData = [sensorsAsyncData.dataFrames lastObject];
        RKAccelerometerData *accelerometerData = sensorsData.accelerometerData;
        RKAttitudeData *attitudeData = sensorsData.attitudeData;
        RKQuaternionData *quaternionData = sensorsData.quaternionData;
        
        double x = accelerometerData.acceleration.x;
        double y = accelerometerData.acceleration.y;
        double z = accelerometerData.acceleration.z;
        
        double currentSquared = x*x + y*y + z*z;
        if(currentSquared > (SHAKE_THRESHOLD * SHAKE_THRESHOLD))
        {
            // shake detected
                        [self stopListeningForShake];
//            [self performSelector:NSSelectorFromString(self.shakeHandler)];
//            [self performSelector:@selector(shakeHandler)];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:nil];

        }
        
 }
}

@end
