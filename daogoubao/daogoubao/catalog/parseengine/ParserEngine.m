//
//  ParserEngine.m
//  DynamicNativeJson
//
//  Created by xiangchenyu on 14-5-17.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "ParserEngine.h"
#import "TFHpple.h"
#import "catalogmodalvc.h"
#import "CatalogTableview.h"
#import "AppMacro.h"

@implementation ParserEngine

+(ParserEngine*) sharedInstance
{
    static ParserEngine *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


-(void) parseIndex1
{
    //1.以后用这个
    //    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.raywenderlich.com/tutorials"];
    //    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    NSString* strPath = [[NSBundle mainBundle] pathForResource:@"index1" ofType:@"html"];
    NSData *dataContent = [NSData dataWithContentsOfFile:strPath];
    
    //2.解析数据
    TFHpple *catalogParser = [TFHpple hppleWithHTMLData:dataContent];
    
    //3.获取数据
    NSString *catalogXPathQueryString = @"//div[@class='content-wrapper']/ul/li/a";
    NSArray  *catalogrialsNodes = [catalogParser searchWithXPathQuery:catalogXPathQueryString];
    
    for (TFHppleElement *element in catalogrialsNodes)
    {
        NSString *elecontent = [[element firstChild] content];
        NSString *eleurl  = [element objectForKey:@"href"];
        
        NSLog(@"elecontent,eleurl->(%@,%@)",elecontent,eleurl);
    }
}

-(void) parseIndex2
{
    //1.以后用这个
    //    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.raywenderlich.com/tutorials"];
    //    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    //    catalogmodalvc *catalogmodalvc = [[catalogmodalvc alloc]init];
    NSString* strPath = [[NSBundle mainBundle] pathForResource:@"index2" ofType:@"html"];
    NSData *dataContent = [NSData dataWithContentsOfFile:strPath];
    
    //2.解析数据
    TFHpple *catalogParser = [TFHpple hppleWithHTMLData:dataContent];
    
    //3.获取数据
    NSString *catalogXPathQueryString = @"//ul[@class='team-members']/li";
    NSArray  *catalogrialsNodes = [catalogParser searchWithXPathQuery:catalogXPathQueryString];
    
    //    NSMutableArray *newcatalog = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in catalogrialsNodes)
    {
        catalogmodal *catalogmodalvc = [[catalogmodal alloc]init];
        for(TFHppleElement *child in element.children)
        {
            if([child.tagName isEqualToString:@"img"])
            {
                catalogmodalvc.imageUrl = [child objectForKey:@"src"];
                catalogmodalvc.title = [[child firstChild] content];
            }
        }
    }
}

-(NSArray*) parseDemo
{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"html"];
    NSData *dataContent = [NSData dataWithContentsOfFile:strPath];
    
    //2.解析数据
    TFHpple *catalogParser = [TFHpple hppleWithXMLData:dataContent];
    
    //3.获取数据
    NSString *imageUrl = nil,*title = nil,*commodityID = nil,*price = nil;
    
    NSString *catalogXPathQueryStringDetail = @"//table[@class='itemlist']/tr/td/table[@class='itemdetail']";
    NSArray *catalogNodesDetail = [catalogParser searchWithXPathQuery:catalogXPathQueryStringDetail];
    
    NSMutableArray *arraymul = [[NSMutableArray alloc]initWithCapacity:0];
    int i = 0;
    for (TFHppleElement *element in catalogNodesDetail)
    {
        title = commodityID = price = nil;
        for (TFHppleElement *children in element.children)
        {
            if([children.tagName isEqualToString:@"tr"])
            {
                TFHppleElement *tfhppleElement = [children.children objectAtIndex:0];
                NSString *classTag = [tfhppleElement objectForKey:@"class"];
                
                if([classTag isEqualToString : @"title"])
                {
                    title = tfhppleElement.text;
                }
                else if([classTag isEqualToString : @"commodityID"])
                {
                    commodityID = tfhppleElement.text;
                }
                else if([classTag isEqualToString : @"price"])
                {
                    price = tfhppleElement.text;
                }
            }
            
        }
        
        NSString *catalogXPathQueryStringImg = @"//table[@class='itemlist']/tr/td/img";
        NSArray *catalogNodesImg = [catalogParser searchWithXPathQuery:catalogXPathQueryStringImg];
        imageUrl = [[catalogNodesImg objectAtIndex:i] objectForKey:@"src"];
        
        catalogmodal *commodity = [[catalogmodal alloc] init];
        NSDictionary *dic = @{@"title": title,
                             @"commodityID" : commodityID,
                             @"price": price,
                              @"imageUrl": imageUrl};
        [commodity initWithDic:dic];
        [arraymul addObject:commodity];
        ++i;
    }
    
    return arraymul;
}


@end
