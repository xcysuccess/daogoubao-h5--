//
//  CatalogTableViewCell.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-20.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "CatalogTableViewCell.h"

@implementation CatalogTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
		[self initUIControl];
		
		[self addSubview:self.imageHeader];
		[self addSubview:self.labelTitle];
		[self addSubview:self.labelID];
		[self addSubview:self.labelPrice];

    }
    return self;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) initUIControl
{
	self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, 20)];
	self.labelID = [[UILabel alloc] initWithFrame:CGRectMake(0, self.labelTitle.frame.size.height, mScreenWidth, 20)];
    self.labelPrice = [[UILabel alloc] initWithFrame:CGRectMake(0, self.labelTitle.frame.size.height + self.labelID.frame.size.height, mScreenWidth, 20)];

	[self setLabelStyle: self.labelTitle];
    [self setLabelStyle: self.labelID];
    [self setLabelStyle: self.labelPrice];
	
    self.imageHeader = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"demo_1.jpg"]];
	self.imageHeader.frame = CGRectMake(0, 2.5, 60, 60);
}

-(void) setLabelStyle :( UILabel*) label
{
    label.backgroundColor = [UIColor redColor];
	label.textAlignment = NSTextAlignmentRight;
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont fontWithName:@"Arial" size:10];
	label.textColor = [UIColor blackColor];
}

@end
