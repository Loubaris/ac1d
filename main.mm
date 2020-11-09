#import "ac1d.h"

NSArray *customCommands = [[NSArray alloc] initWithObjects:
    @"play",
    @"pause", 
    @"next", 
    @"prev", 
    @"home", 
    @"doublehome", 
    @"lock", 
    @"wake",
    @"mute",
    @"unmute",
    @"locationon",
    @"locationoff",nil];

NSArray *customReplyCommands = [[NSArray alloc] initWithObjects:
    @"ismuted",
    @"getpasscode",
    @"unlock",
    @"lastapp",
    @"islocked",nil];

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        ac1d *ac1d_base = [[ac1d alloc] init];
        if (argc < 2) printf("Usage: ac1d <option>\n");
        else {
            NSMutableArray *args = [NSMutableArray array];
            for (int i = 0; i < argc; i++) {
                NSString *str = [[NSString alloc] initWithCString:argv[i] encoding:NSUTF8StringEncoding];
                [args addObject:str];
            }
            if ([args[1] isEqualToString:@"battery"]) {
                [ac1d_base battery];
            } else if ([args[1] isEqualToString:@"vibrate"]) {
                [ac1d_base vibrate];
            } else if ([args[1] isEqualToString:@"locate"]) {
                [ac1d_base locate];
            } else if ([args[1] isEqualToString:@"say"]) {
                if (argc < 3) printf("Usage: ac1d say <message>\n");
                else {
                    [ac1d_base say:args[2]];
                }
            } else if ([args[1] isEqualToString:@"getvol"]) {
                [ac1d_base getvol];
            } else if ([args[1] isEqualToString:@"setvol"]) {
                if (argc < 3) printf("Usage: ac1d setvol <level>\n");
                else {
                    [ac1d_base setvol:args[2]];
                }
            } else if ([args[1] isEqualToString:@"openurl"]) {
                if (argc < 3) printf("Usage: ac1d openurl <url>\n");
                else {
                    [ac1d_base openurl:args[2]];
                }
            } else if ([args[1] isEqualToString:@"openapp"]) {
                if (argc < 3) printf("Usage: ac1d openapp <application>\n");
                else {
                    [ac1d_base openapp:args[2]];
                }
            } else if ([args[1] isEqualToString:@"applications"]) {
                [ac1d_base applications];
            } else if ([args[1] isEqualToString:@"sysinfo"]) {
                [ac1d_base sysinfo];
            } else if ([customCommands containsObject:args[1]]) {
                [ac1d_base send_command:args[1]];
            } else if ([customReplyCommands containsObject:args[1]]) {
                [ac1d_base send_command_reply:args[1]];
            } else printf("Usage: ac1d <option>\n");
        }
    }
    return 0;
}
