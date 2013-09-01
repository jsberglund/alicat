//
//  JSONFixture.m
//  Creativ365
//
//  Created by Jessica Berglund on 9/1/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "JSONFixture.h"

@implementation JSONFixture
+ (NSDictionary *)getPhotoPostJSON
{
    NSDictionary *postsDict =
    @{
      @"blog" :     @{
              @"ask" : @0,
              @"ask_anon" : @0,
              @"can_send_fan_mail" : @YES,
              @"description" : @"",
              @"facebook" : @NO,
              @"facebook_opengraph_enabled" : @NO,
              @"followed" : @0,
              @"is_nsfw" : @NO,
              @"likes" : @0,
              @"name" : @"creativ365",
              @"posts" : @7,
              @"share_likes" : @YES,
              @"title" : @"creativ365",
              @"tweet" : @NO,
              @"twitter_enabled" : @NO,
              @"twitter_send" : @NO,
              @"updated" : @1377995632,
              @"url" : @"http://creativ365.tumblr.com/",
              },
      @"posts" :     @[
              @{
                  @"blog_name" : @"creativ365",
                  @"can_reply" : @NO,
                  @"caption" : @"post caption",
                  @"date" : @"2013-08-23 06:48:23 GMT",
                  @"followed" : @0,
                  @"format" : @"html",
                  @"highlighted" : @[],
                  @"id" : @59085258341,
                  @"image_permalink" : @"http://creativ365.tumblr.com/image/59085258341",
                  @"liked" : @0,
                  @"note_count" : @0,
                  @"photos" :  @[
                          @{
                              @"alt_sizes" :  @[
                                      @{
                                          @"height" : @960,
                                          @"url" : @"http://31.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_1280.jpg",
                                          @"width" : @1280,
                                          },
                                      @{
                                          @"height" : @375,
                                          @"url" : @"http://25.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_500.jpg",
                                          @"width" : @500,
                                          },
                                      @{
                                          @"height" : @300,
                                          @"url" : @"http://25.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_400.jpg",
                                          @"width" : @400,
                                          },
                                      @{
                                          @"height" : @188,
                                          @"url" : @"http://25.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_250.jpg",
                                          @"width" : @250,
                                          },
                                      @{
                                          @"height" : @75,
                                          @"url" : @"http://24.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_100.jpg",
                                          @"width" : @100,
                                          },
                                      @{
                                          @"height" : @75,
                                          @"url" : @"http://24.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_75sq.jpg",
                                          @"width" : @75,
                                          }
                                      ],
                              @"caption" : @"",
                              @"exif" :                     @{
                                      @"Aperture" : @"f/2.4",
                                      @"Camera" : @"iPhone 5",
                                      @"Exposure" : @"1/15th",
                                      @"FocalLength" : @"4mm",
                                      @"ISO" : @800,
                                      },
                              @"original_size" :                     @{
                                      @"height" : @960,
                                      @"url" : @"http://31.media.tumblr.com/25b4cd1a4388fdafdba6f87e8b9ec7c9/tumblr_mrz1knJAnD1sgu7i1o1_1280.jpg",
                                      @"width" : @1280,
                                      },
                              }
                          ],
                  @"post_url" : @"http://creativ365.tumblr.com/post/59085258341",
                  @"reblog_key" : @"lCktq3iI",
                  @"short_url" : @"http://tmblr.co/ZlGVfqt1mNvb",
                  @"slug" : @"",
                  @"state" : @"published",
                  @"tags" :             @[
                          @"food",
                          @"creativ365august2013"
                          ],
                  @"timestamp" : @1377240503,
                  @"type" : @"photo",
                  },
              @{
                  @"blog_name" : @"creativ365",
                  @"can_reply" : @0,
                  @"caption" : @"<p>Ugh, too much coding.</p>",
                  @"date" : @"2013-08-23 05:56:36 GMT",
                  @"followed" : @0,
                  @"format" : @"html",
                  @"highlighted" :             @[
                          ],
                  @"id" : @59082469320,
                  @"image_permalink" : @"http://creativ365.tumblr.com/image/59082469320",
                  @"liked" : @0,
                  @"note_count" : @0,
                  @"photos" :             @[
                          @{
                              @"alt_sizes" :                     @[
                                      @{
                                          @"height" : @627,
                                          @"url" : @"http://24.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_500.jpg",
                                          @"width" : @500,
                                          },
                                      @{
                                          @"height" : @502,
                                          @"url" : @"http://31.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_400.jpg",
                                          @"width" : @400,
                                          },
                                      @{
                                          @"height" : @314,
                                          @"url" : @"http://31.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_250.jpg",
                                          @"width" : @250,
                                          },
                                      @{
                                          @"height" : @125,
                                          @"url" : @"http://24.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_100.jpg",
                                          @"width" : @100,
                                          },
                                      @{
                                          @"height" : @75,
                                          @"url" : @"http://24.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_75sq.jpg",
                                          @"width" : @75,
                                          }
                                      ],
                              @"caption" : @"",
                              @"original_size" :                     @{
                                      @"height" : @627,
                                      @"url" : @"http://24.media.tumblr.com/aeaa2d69048258bcfde27cba39bbe9d4/tumblr_mryz6c8nra1sgu7i1o1_500.jpg",
                                      @"width" : @500,
                                      },
                              }
                          ],
                  @"post_url" : @"http://creativ365.tumblr.com/post/59082469320/ugh-too-much-coding",
                  @"reblog_key" : @"3rsHbrAM",
                  @"short_url" : @"http://tmblr.co/ZlGVfqt1bk-8",
                  @"slug" : @"ugh-too-much-coding",
                  @"state" : @"published",
                  @"tags" :             @[
                          @"cat",
                          @"coding",
                          @"test",
                          @"creativ365august2013"
                          ],
                  @"timestamp" : @1377237396,
                  @"type" : @"photo",
                  }
              ],
      @"total_posts" : @2,
      };
    
    return postsDict;
}


+ (NSDictionary *)getUserJSON
{
    NSDictionary *userDict = @{
                               @"user": @{
                                       @"following": @263,
                                       @"default_post_format": @"html",
                                       @"name": @"Jessica Berglund",
                                       @"likes": @606,
                                       @"blogs": @[
                                               @{
                                                   @"name": @"derekg",
                                                   @"title": @"Derek Gottfrid",
                                                   @"url": @"http://derekg.org/",
                                                   @"tweet": @"auto",
                                                   @"primary": @YES,
                                                   @"followers": @33004929,
                                                   },
                                               @{
                                                   @"name": @"ihatehipstrz",
                                                   @"title": @"I Hate Hipstrz",
                                                   @"url": @"http://derekg.org/",
                                                   @"tweet": @"auto",
                                                   @"primary": @NO,
                                                   @"followers": @33004929,
                                                   }
                                               ]
                                       }};
    
    
    return userDict;
}
@end
