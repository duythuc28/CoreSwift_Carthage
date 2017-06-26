//
//  Constants.swift
//  TimeSheet
//
//  Created by iOS Developer on 4/2/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//
import UIKit

struct APIConstant {
    #if DEVELOPMENT
    static let BASE_URL = "https://dev.getubiq.com/api/2/"
    #else
    static let BASE_URL = "https://app.getubiq.com/api/2/"
    #endif
}

let UIAppDelegate                   = UIApplication.shared.delegate as! AppDelegate

struct Constant {
    struct Publish {
        static let imageCountLimit: Int = 20
        static let sizeLimit: Double = 50 * 1024 * 1024 // 50MB
    }
}

struct Key {
    struct AdobeCreative {
        static let APIKey = "661d151ed57042d59d60e9cbb74cc7f5"
        static let clinetSecret = "93464529-468c-4fc6-a7e3-8889877c55ca"
    }
    struct GoogleAnalytics {
        static let trackingID = "UA-40233846-8"
    }
}

struct Storyboards {
    static let home = "Home"
    static let authentication = "Authentication"
    static let converse = "Converse"
    static let analyse = "Analyse"
    static let mediaGallery = "MediaGallery"
    static let readyToPost = "ReadyToPost"
    static let about = "About"
}

struct ControllerIdentifier {
    static let home = "UBHomeViewController"
    static let leftMenu = "UBLeftMenuViewController"
    static let login = "UBLoginViewController"
    static let homeNavigationController = "UBNavigationHomeViewController"
    static let container = "UBContainerViewController"
    static let converseNavigation = "UBConverseNavigationViewController"
    static let analysePostNavigation = "UBAnalysePostNavigationViewController"
    static let analysePageNavigation = "UBAnalysePageNavigationViewController"
    static let analyseFilterPost = "UBAnalyzeFilterPostController"
    static let previewImageController = "UBImageViewController"
    static let scheduleTimeController = "UBPublishScheduleTimeViewController"
    static let converseReview = "UBConverseReviewViewController"
    static let converseGoogleReview = "UBConverseGoogleReviewViewController"
    static let converseComment = "UBConverseCommentViewController"
    static let conversePost = "UBConversePostViewController"
    static let converseMessenger = "UBConverseMessengerViewController"
    static let converseHistory = "UBConverseHistoryViewController"
    static let mediaGalleryNavigation = "UBMediaGalleryNavigationViewController"
    static let mediaGalleryPreview = "UBMediaGalleryPreviewViewController"
    static let readyToPostNavigation = "UBReadyToPostNavigationViewController"
    static let readyToPost = "UBReadyToPostViewController"
    static let aboutNavigation = "UBAboutNavigationViewController"
    static let about = "UBAboutViewController"
}

struct CellIdentifier {
    static let leftMenu = "leftMenuCell"
    static let textCellIdentifier = "UBHomeTextCell"
    static let imageCellIdentifier = "UBHomeImageCell"
    static let converseHeader = "ConverseHeader"
    struct AnalysePage {
        static let lineChart = "analysePageLineCell"
        static let pieChart = "analysePagePieCell"
        static let popularCity = "analysePageCityCell"
        static let refineHeader = "refineHeader"
        static let refineCell = "refinePageCell"
        static let refinePickerCell = "refinePickerCell"
    }
    static let analysePost = "analysePostCell"
    static let converse = "converseCell"
    static let converseReview = "converseReviewCell"
    static let converseHistory = "converseHistoryCell"
    static let loadMore = "loadMoreCell"
    static let socialNetworkPicker = "socialNetworkPickerCell"
    static let mediaGallery = "mediaGalleryCell"
    static let mediaGalleryLoadMore = "mediaGalleryLoadMoreView"
    static let readyToPost = "readyToPostCell"
}

struct NibName {
    static let leftMenuCell = "UBLeftMenuCell"
    static let leftMenuHeader = "UBMenuHeaderView"
    static let leftSectionHeader = "UBMenuSectionHeader"
    static let leftNotificationHeader = "UBNotificationHeader"
    static let homeTextCell = "UBHomeTextCell"
    static let homeImageCell = "UBHomeImageCell"
    struct AnalysePage {
        static let lineChart = "UBAnalysePageLineCell"
        static let pieChart = "UBAnalysePagePieCell"
        static let popularCity = "UBAnalysePageCityCell"
        static let popularHeader = "UBAnalyzePageCityHeader"
        static let popularFooter = "UBAnalyzePageCityFooter"
        static let refineHeader = "UBRefinePageHeader"
        static let refineCell = "UBRefinePageCell"
        static let refinePickerCell = "UBRefinePickerCell"
    }
    static let analysePost = "UBAnalysePostCell"
    static let submitButton = "UBSubmitButtonFooter"
    static let converseView = "UBConverseView"
    static let converseCell = "UBConverseCell"
    static let converseReviewCell = "UBConverseReviewCell"
    static let converseHistoryCell = "UBConverseHistoryCell"
    static let loadMoreCell = "UBLoadMoreTableFooterView"
    static let socialNetworkPicerCell = "UBSocialNetworkPickerCell"
    static let mediaGalleryCell = "UBMediaGalleryCell"
    static let mediaGalleryLoadMoreView = "UBMediaGalleryLoadMoreView"
    static let readyToPostCell = "UBReadyToPostCell"
}

struct ScreenName {
    static let loginScreen = "login_screen"
    static let forgotPasswordScreen = "forgot_password_screen"
    static let publishNewPostScreen = "publish_new_post_screen"
    static let readyToPostScreen = "ready_to_post_screen"
    static let mediaGalleryScreen = "media_gallery_screen"
    static let mediaGalleryDetailScreen = "media_gallery_detail_screen"
    static let converseScreen = "converse_screen"
    static let converseReviewsScreen = "converse_reviews_screen"
    static let converseCommentsScreen = "converse_comments_screen"
    static let conversePostScreen = "converse_post_screen"
    static let converseMessengerScreen = "converse_messenger_screen"
    static let converseHistoryScreen = "converse_history_screen"
    static let analyzePostScreen = "analyze_post_screen"
    static let analyzePostFilterScreen = "analyze_post_filter_screen"
    static let analyzePageScreen = "analyze_page_screen"
    static let analyzePageFilterScreen = "analyze_page_filter_screen"
    static let leftMenuScreen = "left_menu_screen"
    static let aboutUsScreen = "about_us_screen"
    static let logoutPopup = "logout_popup"
}
