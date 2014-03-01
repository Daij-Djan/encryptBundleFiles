//
//  TestViewController.m
//  test
//
//  Created by Dominik Pich on 01/03/14.
//  Copyright (c) 2014 Dominik Pich. All rights reserved.
//

#import "TestViewController.h"
#import "RNDecryptor.h"
#import "RNOpenSSLDecryptor.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@end

    @implementation TestViewController

    - (void)viewDidLoad
    {
        [super viewDidLoad];

        NSString *path = [[NSBundle mainBundle] pathForResource:@"Encryption-Test" ofType:@"enc"];
        NSData *passEncryptedData =[[NSData alloc] initWithContentsOfFile:path];
        NSString *pass = @"asdasd";
        
        NSData *dataDecrypted = [RNOpenSSLDecryptor decryptData:passEncryptedData withSettings:kRNCryptorAES256Settings password:pass error:nil];
        id plist = [NSPropertyListSerialization propertyListFromData:dataDecrypted mutabilityOption:NSPropertyListImmutable format:nil errorDescription:nil];
        
        assert(plist);
        self.text.text = [plist description];
    }

    @end
