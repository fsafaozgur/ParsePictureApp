//
//  FeedViewModel.swift
//  ParsePictureApp
//
//  Created by Safa on 10.09.2023.
//

import Foundation


struct FeedTableViewModel {
    
    var postList : [Post]
    
    func numberOfRowSection() -> Int {
        return postList.count
    }
    
    func cellForRowAt (index : Int) -> FeedViewModel {
        let post = postList[index]
        return FeedViewModel(post: post)
    }
}

struct FeedViewModel {
    
    var post : Post
    
    var comment : String {
        return post.comment!
    }
    var username : String {
        return post.username!
    }
    var imageData : Data {
        return post.imageData!
    }
    
    
}

