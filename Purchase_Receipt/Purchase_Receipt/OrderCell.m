//
//  OrderCell.m
//  barcodeReader
//
//  Created by Madhumathi Karthikeyan on 03/01/14.
//

#import "OrderCell.h"

@implementation OrderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
         _itemlbl = [[UILabel alloc] init];
        _itemlbl.font = [UIFont fontWithName:@"Aller" size:17.f];
         _itemlbl.textAlignment=NSTextAlignmentLeft;
         _itemlbl.backgroundColor = [UIColor clearColor];
        
        _descLbl = [[UILabel alloc] init];
        _descLbl.font = [UIFont fontWithName:@"Aller" size:17.f];
        _descLbl.textAlignment=NSTextAlignmentLeft;
        _descLbl.numberOfLines=2;
        _descLbl.backgroundColor = [UIColor clearColor];
        
        _qtyTxt = [[UITextField alloc] init];
        _qtyTxt.font = [UIFont fontWithName:@"Aller" size:17.f];
        _qtyTxt.borderStyle = UITextBorderStyleLine;
        _qtyTxt.textAlignment=NSTextAlignmentCenter;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            
            _qtyTxt.keyboardType = UIKeyboardTypeNumberPad;
            
        }
        else {
            _qtyTxt.keyboardType = UIKeyboardTypeDefault;
            
        }
        _qtyTxt.userInteractionEnabled=YES;
        _qtyTxt.delegate=self;
        _qtyTxt.textColor = [UIColor blackColor];
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

            _itemlbl.frame=CGRectMake(15+25, 10, 50+30+50, 44);
            
            _descLbl.frame=CGRectMake(140+20, 10, 50+250, 44);

            _qtyTxt.frame=CGRectMake(220+290+30, 10, 50, 44);

        }
        else{
          
            _itemlbl.frame=CGRectMake(20, 10, 80, 22);
            
            _descLbl.frame=CGRectMake(95, 10, 100, 22);
            
            _qtyTxt.frame=CGRectMake(240, 10, 25, 25);

        }
        
        self.contentView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
        
        [self.contentView addSubview:_itemlbl];
        [self.contentView addSubview:_descLbl];
        [self.contentView addSubview:_qtyTxt];

    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self.delegate touchedTheCell:textField :textField.text];
    
    NSLog(@"yeah inform someone of my change %@", textField.text);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
