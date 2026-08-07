import 'package:get/get.dart';
import '../Utils/StaticString/static_string.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'bn_BD': {
          StaticString.appName: 'HomeCare OS',
          StaticString.appSubtitle: 'বাড়ির সম্পূর্ণ যত্ন',
          StaticString.welcomeMessage: 'HomeCare OS-এ স্বাগতম',
          StaticString.loading: 'লোড হচ্ছে...',
          StaticString.noInternet: 'ইন্টারনেট সংযোগ নেই',
          StaticString.save: 'সংরক্ষণ করুন',
          StaticString.cancel: 'বাতিল করুন',
          StaticString.next: 'পরবর্তী',
          StaticString.copy: 'কপি',
          StaticString.share: 'শেয়ার করুন',
          StaticString.delete: 'মুছে ফেলুন',
          StaticString.add: 'যোগ করুন',
          StaticString.edit: 'সম্পাদনা',
          StaticString.confirm: 'নিশ্চিত করুন',
          StaticString.back: 'ফিরে যান',
          StaticString.search: 'অনুসন্ধান',
          StaticString.success: 'সফল হয়েছে',
          StaticString.error: 'ত্রুটি',

          // Navigation Bar
          StaticString.navHome: 'হোম',
          StaticString.navService: 'সেবা',
          StaticString.navBooking: 'বুকিং',
          StaticString.navTask: 'কাজ',
          StaticString.navIncome: 'আয়',
          StaticString.navHelp: 'সহায়তা',
          StaticString.navProfile: 'প্রোফাইল',

          // Onboarding Screen
          StaticString.onboardingTitle1: 'বাড়ির যত্নে',
          StaticString.onboardingTitle2: 'আমরা আছি',
          StaticString.onboardingSub1: 'বিশ্বস্ত প্রফেশনালদের সাথে',
          StaticString.onboardingSub2: 'বাড়ির সব সেবা এক জায়গায়',
          StaticString.statProfessionalLabel: 'প্রফেশনাল',
          StaticString.statRatingLabel: 'রেটিং',
          StaticString.exploreNow: 'এখনই দেখুন',
          StaticString.serviceProviderLogin: 'সেবাদাতা হিসেবে লগইন',

          // Auth
          StaticString.loginTitle: 'লগইন করুন',
          StaticString.loginSubTitle: 'আপনার অ্যাকাউন্টে প্রবেশ করুন',
          StaticString.signupTitle: 'নিবন্ধন করুন',
          StaticString.signupSubTitle: 'নতুন একাউন্ট তৈরি করুন',
          StaticString.fullNameLabel: 'সম্পূর্ণ নাম',
          StaticString.emailLabel: 'ইমেইল',
          StaticString.fullNameHint: 'আপনার নাম',
          StaticString.mobileLabel: 'মোবাইল নম্বর',
          StaticString.passwordLabel: 'পাসওয়ার্ড',
          StaticString.passwordLoginHint: 'পাসওয়ার্ড দিন',
          StaticString.passwordSignupHint: 'কমপক্ষে ৮ অক্ষর',
          StaticString.forgotPassword: 'পাসওয়ার্ড ভুলেছেন?',
          StaticString.signupTermsText: 'নিবন্ধন করে আপনি আমাদের ',
          StaticString.termsLink: 'শর্তাবলী',
          StaticString.andText: ' ও ',
          StaticString.privacyLink: 'গোপনীয়তা নীতি',
          StaticString.acceptText: ' মেনে নিচ্ছেন।',
          StaticString.dontHaveAccount: 'একাউন্ট নেই? ',
          StaticString.alreadyHaveAccount: 'ইতিমধ্যে একাউন্ট আছে? ',
          StaticString.forgotPasswordTitle: 'পাসওয়ার্ড পুনরুদ্ধার',
          StaticString.forgotPasswordSubTitle: 'মোবাইল নম্বর দিন। আমরা কোড পাঠাব।',
          StaticString.sendCode: 'কোড পাঠান',
          StaticString.otpTitle: 'ওটিপি যাচাই',
          StaticString.otpSubTitle: 'আপনার মোবাইলে পাঠানো ৬ সংখ্যার কোডটি দিন',
          StaticString.didntGetCode: 'কোড পাননি? ',
          StaticString.resendCode: 'পুনরায় পাঠান',
          StaticString.verify: 'যাচাই করুন',

          // Service Provider Signup
          StaticString.providerSignupTitle: 'সেবাদাতা নিবন্ধন',
          StaticString.providerSignupSub: 'তথ্য দিন ও সেবাদাতা হিসেবে নিবন্ধন করুন',
          StaticString.expertiseLabel: 'বিশেষজ্ঞতা বেছে নিন',
          StaticString.seeMore: 'আরও দেখুন',
          StaticString.hourlyRateLabel: 'ঘণ্টাপ্রতি রেট',
          StaticString.expCleaning: 'ক্লিনিং',
          StaticString.expAcService: 'এসি সার্ভিস',
          StaticString.expElectric: 'ইলেকট্রিশিয়ান',
          StaticString.expPlumbing: 'প্লাম্বিং',
          StaticString.expPestControl: 'প্যাস্ট কন্ট্রোল',
          StaticString.expCooking: 'রান্না',

          // Customer Home Page
          StaticString.greeting: 'আস-সালামু আলাইকুম👋',
          StaticString.searchHint: 'কী সেবা চান?',
          StaticString.aiTitle: 'বাড়ির সমস্যা বলুন,\nআমরা সমাধান দেব',
          StaticString.chatNow: 'চাট করুন >',
          StaticString.timeline: 'টাইমলাইন',
          StaticString.homePassport: 'হোম পাসপোর্ট',
          StaticString.reviews: 'রিভিউ',
          StaticString.popularServices: 'জনপ্রিয় সেবা',
          StaticString.seeAll: 'সব দেখুন',
          StaticString.upcomingServices: 'আসন্ন সেবা',
          StaticString.upcomingBadge: 'আসন্ন',
          StaticString.trackService: 'ট্র্যাক করুন',
          StaticString.details: 'বিস্তারিত',
          StaticString.categories: 'ক্যাটাগরি',
          StaticString.primeTitle: 'সব সেবায় ১৫% ছাড়',
          StaticString.primeSubtitle: 'মাত্র ৪৯৯ টাকা/মাস',
          StaticString.joinNow: 'যোগ দিন',
          StaticString.whyHomeCare: 'কেন HomeCare OS?',
          StaticString.trustedProf: 'বিশ্বস্ত প্রফেশনাল',
          StaticString.trustedProfSub: 'যাচাইকৃত ও প্রশিক্ষিত',
          StaticString.fastService: 'দ্রুত সেবা',
          StaticString.fastServiceSub: 'একই দিনে সেবা পান',
          StaticString.satisfactionGar: 'সন্তুষ্টি গ্যারান্টি',
          StaticString.satisfactionGarSub: '১০০% নিশ্চিত',

          // Customer Profile & Menu Items
          StaticString.editProfile: 'প্রোফাইল সম্পাদনা',
          StaticString.myBookings: 'আমার বুকিং',
          StaticString.myReviews: 'আমার রিভিউ',
          StaticString.homeCarePrime: 'HomeCare Prime',
          StaticString.referral: 'রেফারেল',
          StaticString.savedAddresses: 'সংরক্ষিত ঠিকানা',
          StaticString.helpSupportTitle: 'সাহায্য ও সাপোর্ট',
          StaticString.contactUs: 'যোগাযোগ করুন',
          StaticString.changeLanguage: 'ভাষা পরিবর্তন',
          StaticString.settings: 'সেটিংস',
          StaticString.logout: 'লগআউট',

          // Referral Screen
          StaticString.referFriendTitle: 'বন্ধুকে রেফার করুন',
          StaticString.referFriendSub: 'প্রতি রেফারেলে আপনি পাবেন ১০০',
          StaticString.yourReferralCode: 'আপনার রেফারেল কোড',
          StaticString.yourEarnings: 'আপনার আয়',
          StaticString.earnedAmount: 'অর্জিত',
          StaticString.balanceAmount: 'ব্যালেন্স',

          // HomeCare Prime Screen
          StaticString.primeMembershipTitle: 'Prime সদস্যপদ',
          StaticString.primeMembershipSub: 'বাড়ির সম্পূর্ণ যত্নে সেরা মূল্য',
          StaticString.joinPrimeButton: 'Prime সদস্য হন',
          StaticString.monthlyPlan: 'মাসিক প্ল্যান',
          StaticString.annualPlan: 'বার্ষিক প্ল্যান',
          StaticString.discountSave50: '৫০% সাশ্রয়',

          // Saved Addresses Screen
          StaticString.selectAddressTitle: 'ঠিকানা নির্বাচন',
          StaticString.addNewAddress: 'নতুন ঠিকানা যোগ করুন',
          StaticString.defaultLabel: 'ডিফল্ট',
          StaticString.addressLabel: 'ঠিকানা',

          // Change Language Screen
          StaticString.bangla: 'বাংলা',
          StaticString.english: 'English',

          // Settings Screen
          StaticString.pushNotification: 'পুশ নোটিফিকেশন',
          StaticString.pushNotificationSub: 'বুকিং আপডেট ও অফার',
          StaticString.smsNotification: 'SMS নোটিফিকেশন',
          StaticString.smsNotificationSub: 'মোবাইলে এসএমএস পান',
          StaticString.languageLabel: 'ভাষা',
          StaticString.appVersionLabel: 'অ্যাপ ভার্সন',

          // Footer
          StaticString.lastUpdatedText: 'সর্বশেষ আপডেট: জুলাই ২০২৫',

          // Booking Review
          StaticString.bookingReviewTitle: 'বুকিং রিভিউ',
          StaticString.serviceDetails: 'সেবার বিবরণ',
          StaticString.changeText: 'পরিবর্তন',
          StaticString.dateTimeTitle: 'তারিখ ও সময়',
          StaticString.priceDetails: 'মূল্য বিবরণ',
          StaticString.servicePriceLabel: 'সেবা মূল্য',
          StaticString.travelChargeLabel: 'ভ্রমণ চার্জ',
          StaticString.totalLabel: 'মোট',
          StaticString.proceedToPayment: 'পেমেন্ট করুন',

          // Payment
          StaticString.paymentTitle: 'পেমেন্ট',
          StaticString.totalPayment: 'মোট পেমেন্ট',
          StaticString.paymentMethod: 'পেমেন্ট পদ্ধতি',
          StaticString.bkashNumberLabel: 'bKash নম্বর',
          StaticString.sslSecureBadge: 'SSL এনক্রিপ্টেড নিরাপদ পেমেন্ট',
          StaticString.confirmPayment: 'পেমেন্ট নিশ্চিত করুন',

          // All Services
          StaticString.allServicesTitle: 'সব সেবা',
          StaticString.searchServiceHint: 'সেবা খুঁজুন...',
          StaticString.noServicesFound: 'কোনো সেবা পাওয়া যায়নি',

          // Booking Steps
          StaticString.stepTime: 'সময়',

          // Booking Success
          StaticString.bookingSuccessHeading: 'বুকিং সম্পন্ন! 🎉',
          StaticString.bookingSuccessSubheading: 'আপনার বুকিং নিশ্চিত হয়েছে।',
          StaticString.bookingIdLabel: 'বুকিং আইডি: ',
          StaticString.trackBookingButton: 'বুকিং ট্র্যাক করুন',
          StaticString.backToHomeButton: 'হোমে ফিরুন',

          // Booking Tracking
          StaticString.bookingTrackingTitle: 'বুকিং ট্র্যাকিং',
          StaticString.progressTitle: 'অগ্রগতি',
          StaticString.completeAndRateButton: 'সেবা সম্পন্ন করুন ও রেট করুন',
          StaticString.havingIssueText: 'সমস্যা হচ্ছে?',

          // Contact Us
          StaticString.sendMessageTitle: 'বার্তা পাঠান',
          StaticString.subjectLabel: 'বিষয়',
          StaticString.descriptionLabel: 'বিবরণ',
          StaticString.describeIssueHint: 'আপনার সমস্যার বিবরণ লিখুন...',
          StaticString.sendButton: 'পাঠান',

          // Help & Support
          StaticString.liveChatTitle: 'লাইভ চ্যাট',
          StaticString.chatNowSubtitle: 'এখনই চ্যাট করুন',
          StaticString.callUsTitle: 'কল করুন',
          StaticString.faqTitle: 'সচরাচর জিজ্ঞাসা',

          // My Bookings
          StaticString.tabCompleted: 'সম্পন্ন',
          StaticString.tabCancelled: 'বাতিল',
          StaticString.noBookingsFound: 'কোনো বুকিং পাওয়া যায়নি',

          // Rate Service
          StaticString.rateServiceTitle: 'রেটিং দিন',
          StaticString.howWasServiceQuestion: 'সেবা কেমন ছিল?',
          StaticString.touchStarToRate: 'তারকা ছুঁয়ে রেট করুন',
          StaticString.whatWasGoodQuestion: 'কী ভালো লেগেছে?',
          StaticString.commentOptionalLabel: 'মন্তব্য (ঐচ্ছিক)',
          StaticString.shareExperienceHint: 'আপনার অভিজ্ঞতা শেয়ার করুন...',
          StaticString.submitRatingButton: 'রেটিং জমা দিন',
          StaticString.skipButton: 'এড়িয়ে যান',

          // Select Date Time
          StaticString.selectDateTitle: 'তারিখ বেছে নিন',
          StaticString.selectTimeTitle: 'সময় বেছে নিন',

          // Home Passport
          StaticString.healthScoreLabel: 'হেলথ স্কোর',
          StaticString.totalServicesLabel: 'মোট সেবা',
          StaticString.thisMonthLabel: 'এই মাসে',
          StaticString.savingsLabel: 'সাশ্রয়',
          StaticString.houseInfoTitle: 'বাড়ির তথ্য',
          StaticString.propertyTypeLabel: 'ধরন',
          StaticString.propertySizeLabel: 'আকার',
          StaticString.roomsLabel: 'ঘর',
          StaticString.registeredLabel: 'নিবন্ধিত',
          StaticString.editTitle: 'এডিট করুন',
          StaticString.smartRecommendationsTitle: 'স্মার্ট সুপারিশ',
          StaticString.bookAction: 'বুক',

          // Home Timeline
          StaticString.homeTimelineTitle: 'হোম টাইমলাইন',
          StaticString.houseHealthScoreTitle: 'বাড়ির হেলথ স্কোর',
          StaticString.healthScoreTip: 'এসি সার্ভিসিং ও ট্যাংক পরিষ্কার করলে স্কোর বাড়বে',
          StaticString.serviceHistoryTitle: 'সেবার ইতিহাস',
          StaticString.upcomingMaintenanceTitle: 'আসন্ন রক্ষণাবেক্ষণ',
          StaticString.bookNowAction: 'বুক করুন',

          // Service Details
          StaticString.whatIsIncludedTitle: 'সেবায় যা থাকবে',
          StaticString.customerReviewsTitle: 'গ্রাহকদের মতামত',
          StaticString.bookNowPrefix: 'এখনই বুক করুন',

          // Notification
          StaticString.notificationsTitle: 'নোটিফিকেশন',
          StaticString.markAllRead: 'সব পড়েছি',
        },
        'en_US': {
          StaticString.appName: 'HomeCare OS',
          StaticString.appSubtitle: 'Complete Home Care',
          StaticString.welcomeMessage: 'Welcome to HomeCare OS',
          StaticString.loading: 'Loading...',
          StaticString.noInternet: 'No Internet Connection',
          StaticString.save: 'Save',
          StaticString.cancel: 'Cancel',
          StaticString.next: 'Next',
          StaticString.copy: 'Copy',
          StaticString.share: 'Share',
          StaticString.delete: 'Delete',
          StaticString.add: 'Add',
          StaticString.edit: 'Edit',
          StaticString.confirm: 'Confirm',
          StaticString.back: 'Back',
          StaticString.search: 'Search',
          StaticString.success: 'Success',
          StaticString.error: 'Error',

          // Navigation Bar
          StaticString.navHome: 'Home',
          StaticString.navService: 'Services',
          StaticString.navBooking: 'Bookings',
          StaticString.navTask: 'Tasks',
          StaticString.navIncome: 'Earnings',
          StaticString.navHelp: 'Help',
          StaticString.navProfile: 'Profile',

          // Onboarding Screen
          StaticString.onboardingTitle1: 'For Home Care',
          StaticString.onboardingTitle2: 'We Are Here',
          StaticString.onboardingSub1: 'With trusted professionals',
          StaticString.onboardingSub2: 'All home services in one place',
          StaticString.statProfessionalLabel: 'Professionals',
          StaticString.statRatingLabel: 'Rating',
          StaticString.exploreNow: 'Explore Now',
          StaticString.serviceProviderLogin: 'Login as Service Provider',

          // Auth
          StaticString.loginTitle: 'Log In',
          StaticString.loginSubTitle: 'Log in to your account',
          StaticString.signupTitle: 'Sign Up',
          StaticString.signupSubTitle: 'Create a new account',
          StaticString.fullNameLabel: 'Full Name',
          StaticString.emailLabel: 'Email',
          StaticString.fullNameHint: 'Your Name',
          StaticString.mobileLabel: 'Mobile Number',
          StaticString.passwordLabel: 'Password',
          StaticString.passwordLoginHint: 'Enter password',
          StaticString.passwordSignupHint: 'Minimum 8 characters',
          StaticString.forgotPassword: 'Forgot password?',
          StaticString.signupTermsText: 'By signing up, you agree to our ',
          StaticString.termsLink: 'Terms & Conditions',
          StaticString.andText: ' and ',
          StaticString.privacyLink: 'Privacy Policy',
          StaticString.acceptText: '.',
          StaticString.dontHaveAccount: 'Don\'t have an account? ',
          StaticString.alreadyHaveAccount: 'Already have an account? ',
          StaticString.forgotPasswordTitle: 'Reset Password',
          StaticString.forgotPasswordSubTitle: 'Enter mobile number. We will send a code.',
          StaticString.sendCode: 'Send Code',
          StaticString.otpTitle: 'OTP Verification',
          StaticString.otpSubTitle: 'Enter 6-digit code sent to your mobile',
          StaticString.didntGetCode: 'Didn\'t receive code? ',
          StaticString.resendCode: 'Resend',
          StaticString.verify: 'Verify',

          // Service Provider Signup
          StaticString.providerSignupTitle: 'Provider Registration',
          StaticString.providerSignupSub: 'Enter your info to register as a service provider',
          StaticString.expertiseLabel: 'Choose Expertise',
          StaticString.seeMore: 'See More',
          StaticString.hourlyRateLabel: 'Hourly Rate',
          StaticString.expCleaning: 'Cleaning',
          StaticString.expAcService: 'AC Service',
          StaticString.expElectric: 'Electrician',
          StaticString.expPlumbing: 'Plumbing',
          StaticString.expPestControl: 'Pest Control',
          StaticString.expCooking: 'Cooking',

          // Customer Home Page
          StaticString.greeting: 'Assalamu Alaikum👋',
          StaticString.searchHint: 'Which service do you need?',
          StaticString.aiTitle: 'Describe your home issue,\nwe will solve it',
          StaticString.chatNow: 'Chat Now >',
          StaticString.timeline: 'Timeline',
          StaticString.homePassport: 'Home Passport',
          StaticString.reviews: 'Reviews',
          StaticString.popularServices: 'Popular Services',
          StaticString.seeAll: 'See All',
          StaticString.upcomingServices: 'Upcoming Services',
          StaticString.upcomingBadge: 'Upcoming',
          StaticString.trackService: 'Track Service',
          StaticString.details: 'Details',
          StaticString.categories: 'Categories',
          StaticString.primeTitle: '15% Off All Services',
          StaticString.primeSubtitle: 'Only ৳499/month',
          StaticString.joinNow: 'Join Now',
          StaticString.whyHomeCare: 'Why HomeCare OS?',
          StaticString.trustedProf: 'Trusted Professionals',
          StaticString.trustedProfSub: 'Verified & trained',
          StaticString.fastService: 'Fast Service',
          StaticString.fastServiceSub: 'Same-day service',
          StaticString.satisfactionGar: 'Satisfaction Guarantee',
          StaticString.satisfactionGarSub: '100% assured',

          // Customer Profile & Menu Items
          StaticString.editProfile: 'Edit Profile',
          StaticString.myBookings: 'My Bookings',
          StaticString.myReviews: 'My Reviews',
          StaticString.homeCarePrime: 'HomeCare Prime',
          StaticString.referral: 'Referral',
          StaticString.savedAddresses: 'Saved Addresses',
          StaticString.helpSupportTitle: 'Help & Support',
          StaticString.contactUs: 'Contact Us',
          StaticString.changeLanguage: 'Change Language',
          StaticString.settings: 'Settings',
          StaticString.logout: 'Log Out',

          // Referral Screen
          StaticString.referFriendTitle: 'Refer a Friend',
          StaticString.referFriendSub: 'Get 100 for each referral',
          StaticString.yourReferralCode: 'Your Referral Code',
          StaticString.yourEarnings: 'Your Earnings',
          StaticString.earnedAmount: 'Earned',
          StaticString.balanceAmount: 'Balance',

          // HomeCare Prime Screen
          StaticString.primeMembershipTitle: 'Prime Membership',
          StaticString.primeMembershipSub: 'Best price for total home care',
          StaticString.joinPrimeButton: 'Join Prime',
          StaticString.monthlyPlan: 'Monthly Plan',
          StaticString.annualPlan: 'Annual Plan',
          StaticString.discountSave50: '50% Save',

          // Saved Addresses Screen
          StaticString.selectAddressTitle: 'Select Address',
          StaticString.addNewAddress: 'Add New Address',
          StaticString.defaultLabel: 'Default',
          StaticString.addressLabel: 'Address',

          // Change Language Screen
          StaticString.bangla: 'Bangla',
          StaticString.english: 'English',

          // Settings Screen
          StaticString.pushNotification: 'Push Notifications',
          StaticString.pushNotificationSub: 'Booking updates & offers',
          StaticString.smsNotification: 'SMS Notifications',
          StaticString.smsNotificationSub: 'Receive SMS on mobile',
          StaticString.languageLabel: 'Language',
          StaticString.appVersionLabel: 'App Version',

          // Footer
          StaticString.lastUpdatedText: 'Last updated: July 2025',

          // Booking Review
          StaticString.bookingReviewTitle: 'Booking Review',
          StaticString.serviceDetails: 'Service Details',
          StaticString.changeText: 'Change',
          StaticString.dateTimeTitle: 'Date & Time',
          StaticString.priceDetails: 'Price Details',
          StaticString.servicePriceLabel: 'Service Price',
          StaticString.travelChargeLabel: 'Travel Charge',
          StaticString.totalLabel: 'Total',
          StaticString.proceedToPayment: 'Proceed to Payment',

          // Payment
          StaticString.paymentTitle: 'Payment',
          StaticString.totalPayment: 'Total Payment',
          StaticString.paymentMethod: 'Payment Method',
          StaticString.bkashNumberLabel: 'bKash Number',
          StaticString.sslSecureBadge: 'SSL Encrypted Secure Payment',
          StaticString.confirmPayment: 'Confirm Payment',

          // All Services
          StaticString.allServicesTitle: 'All Services',
          StaticString.searchServiceHint: 'Search services...',
          StaticString.noServicesFound: 'No services found',

          // Booking Steps
          StaticString.stepTime: 'Time',

          // Booking Success
          StaticString.bookingSuccessHeading: 'Booking Completed! 🎉',
          StaticString.bookingSuccessSubheading: 'Your booking has been confirmed.',
          StaticString.bookingIdLabel: 'Booking ID: ',
          StaticString.trackBookingButton: 'Track Booking',
          StaticString.backToHomeButton: 'Back to Home',

          // Booking Tracking
          StaticString.bookingTrackingTitle: 'Booking Tracking',
          StaticString.progressTitle: 'Progress',
          StaticString.completeAndRateButton: 'Complete Service & Rate',
          StaticString.havingIssueText: 'Having issues?',

          // Contact Us
          StaticString.sendMessageTitle: 'Send Message',
          StaticString.subjectLabel: 'Subject',
          StaticString.descriptionLabel: 'Description',
          StaticString.describeIssueHint: 'Describe your issue...',
          StaticString.sendButton: 'Send',

          // Help & Support
          StaticString.liveChatTitle: 'Live Chat',
          StaticString.chatNowSubtitle: 'Chat now',
          StaticString.callUsTitle: 'Call Us',
          StaticString.faqTitle: 'Frequently Asked Questions',

          // My Bookings
          StaticString.tabCompleted: 'Completed',
          StaticString.tabCancelled: 'Cancelled',
          StaticString.noBookingsFound: 'No bookings found',

          // Rate Service
          StaticString.rateServiceTitle: 'Rate Service',
          StaticString.howWasServiceQuestion: 'How was the service?',
          StaticString.touchStarToRate: 'Tap stars to rate',
          StaticString.whatWasGoodQuestion: 'What did you like?',
          StaticString.commentOptionalLabel: 'Comment (Optional)',
          StaticString.shareExperienceHint: 'Share your experience...',
          StaticString.submitRatingButton: 'Submit Rating',
          StaticString.skipButton: 'Skip',

          // Select Date Time
          StaticString.selectDateTitle: 'Select Date',
          StaticString.selectTimeTitle: 'Select Time',

          // Home Passport
          StaticString.healthScoreLabel: 'Health Score',
          StaticString.totalServicesLabel: 'Total Services',
          StaticString.thisMonthLabel: 'This Month',
          StaticString.savingsLabel: 'Savings',
          StaticString.houseInfoTitle: 'House Information',
          StaticString.propertyTypeLabel: 'Type',
          StaticString.propertySizeLabel: 'Size',
          StaticString.roomsLabel: 'Rooms',
          StaticString.registeredLabel: 'Registered',
          StaticString.editTitle: 'Edit',
          StaticString.smartRecommendationsTitle: 'Smart Recommendations',
          StaticString.bookAction: 'Book',

          // Home Timeline
          StaticString.homeTimelineTitle: 'Home Timeline',
          StaticString.houseHealthScoreTitle: 'House Health Score',
          StaticString.healthScoreTip: 'AC servicing and tank cleaning increase your score',
          StaticString.serviceHistoryTitle: 'Service History',
          StaticString.upcomingMaintenanceTitle: 'Upcoming Maintenance',
          StaticString.bookNowAction: 'Book Now',

          // Service Details
          StaticString.whatIsIncludedTitle: 'What\'s Included',
          StaticString.customerReviewsTitle: 'Customer Reviews',
          StaticString.bookNowPrefix: 'Book Now',

          // Notification
          StaticString.notificationsTitle: 'Notifications',
          StaticString.markAllRead: 'Mark All Read',
        },
      };
}
