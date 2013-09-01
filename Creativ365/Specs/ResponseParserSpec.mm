#import "ResponseParser.h"
#import "JSONFixture.h"
#import "UserInfo.h"
#import "PhotoPost.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ResponseParserSpec)

describe(@"ResponseParser", ^{
    __block ResponseParser *parser;

    beforeEach(^{
        parser = [[ResponseParser alloc]init];
    });
    
    describe(@"Post Parsing", ^{
        __block NSDictionary *postDict;
        __block NSArray *posts;
        
        beforeEach(^{
            postDict = [JSONFixture getPhotoPostJSON];
            posts = [parser parseIntoPostsWithJSONData:postDict];
        });
        
        it(@"has 2 posts", ^{
            posts.count should equal(2);
        });
        
        context(@"first post", ^{
            __block PhotoPost *firstPost;
            
            beforeEach(^{
                firstPost = posts[0];
            });
            
            it(@"has the correct title", ^{
                firstPost.title should equal(@"post caption");
            });
            
            it(@"has the correct id", ^{
                firstPost.postID should equal(@"59085258341");
            });
            
            it(@"has the correct url", ^{
                [firstPost.postUrl absoluteString] should equal(@"http://creativ365.tumblr.com/post/59085258341");
            });
            
            it(@"has the correct date", ^{
                NSDate *testDate = [NSDate dateWithTimeIntervalSince1970:([@"1377240503" longLongValue])];
                firstPost.postDate  should equal(testDate);
            });
            
            it(@"has the correct timestamp", ^{
                firstPost.timestamp should equal(1377240503);
            });
            
            it(@"has the correct full size photo url", ^{
                [firstPost.fullPhotoUrl absoluteString] should equal(@"http://31.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_1280.jpg");
            });
            
            it(@"has the correct thumbnail url", ^{
                [firstPost.thumbnailUrl absoluteString] should equal(@"http://25.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_250.jpg");
            });
            
            it(@"has the correct icon url", ^{
                [firstPost.iconUrl absoluteString] should equal(@"http://24.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_75sq.jpg");
            });
        });
    });
    
    
    describe(@"User Parsing", ^{
        __block NSDictionary *userDict;
        __block UserInfo *parsedUser;
        
        beforeEach(^{
            userDict = [JSONFixture getUserJSON];
            parsedUser = [parser parseIntoUserInfoWithJSONData:userDict];
        });
        
        it(@"has the correct name", ^{
            parsedUser.name should equal(@"Jessica Berglund");
        });
        
        it(@"has 2 blogs", ^{
            parsedUser.blogs.count should equal(2);
        });
        
        context(@"primary blog", ^{
            it(@"has the correct name", ^{
                parsedUser.primaryBlog.name should equal(@"derekg");
            });
            
            it(@"has the correct title", ^{
                parsedUser.primaryBlog.title should equal(@"Derek Gottfrid");
            });
            
            it(@"has the correct url", ^{
                parsedUser.primaryBlog.url should equal(@"http://derekg.org/");
            });
        });
    });
    
});

SPEC_END
