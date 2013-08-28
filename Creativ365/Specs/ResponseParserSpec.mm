#import "ResponseParser.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ResponseParserSpec)

describe(@"ResponseParser", ^{
    __block ResponseParser *parser;

    beforeEach(^{
        parser = [[ResponseParser alloc]init];
    });
    
    it(@"parses post JSON into a post object", ^{
        
    });
});

SPEC_END
