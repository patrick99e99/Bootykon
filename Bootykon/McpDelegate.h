@protocol McpDelegate <NSObject>

-(void)shouldUpdateMusicStatus:(NSString *)status;
-(void)shouldUpdateDialogStatus:(NSString *)status;

@end
