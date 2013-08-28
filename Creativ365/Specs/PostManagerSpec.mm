#import "PostManager.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(PostManagerSpec)

describe(@"PostManager", ^{
    __block PostManager *postManager;

    beforeEach(^{
        postManager = [[PostManager alloc] init];
    });
    
    it(@"returns proper tag for given month and year", ^{
        [postManager getTagByMonth:@"August" andYear:@"2013"] should equal(@"creativ365August2013");
    });
});

SPEC_END
