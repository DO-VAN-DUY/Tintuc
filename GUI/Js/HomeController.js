// app.controller('homecontroller',function($scope,$http){
//     // $scope.getLogoFooter = function(){
//     //     $http.get('/home/logo').then((response)=>{
//     //         $scope.logo = response.data;
//     //     })
//     //     $http.get('/home/footer').then((response)=>{
//     //         console.log(response.data);
//     //         $scope.footer = response.data;
//     //     })
//     // }
//     //$scope.getLogoFooter();
//     $scope.getBannerPosts = function(){
//         $http.get('/home/bannerposts').then((response)=>{
//             $scope.bannerposts = response.data.data;
//             console.log($scope.bannerposts);
//             $scope.firstpost = $scope.bannerposts[0];
//             $scope.bannerposts.shift();
//             $scope.loading = true;
//             $('#header').show();
//             console.log($scope.bannerposts);
//         })
//     }
//     $scope.getPosts = function(){
//         var url = new URL(window.location.href);
//         var page = parseInt(url.searchParams.get('page'));
//         if(!page)
//             page = 1;
//         console.log(page);
//         $http.get('/home/getposts?page='+page).then((response)=>{
//             console.log(response.data);
//             $scope.posts = response.data[0].data;
//             if(page==1){
//                if($scope.posts.includes($scope.firstpost)){
//                    $scope.posts.shift();
//                }
//                $scope.bannerposts.forEach(banner => {
//                    $scope.posts.forEach(post => {
//                        if(post.id==banner.id){
//                            console.log('pos');
//                            $scope.posts.shift();
//                        }
//                    });
//                });
//             }
//             $scope.posts.shift();
//             $('#paginate').html(response.data[1]);
//         })
//     }
//     $scope.getCategories = function(){
//         $http.get('/home/getcategory').then((response)=>{
//             $scope.categories = response.data;
//         })
//     }
//     $scope.getPostsWeeks = function(){
//         $http.get('/home/getpostsweeks').then((response)=>{
//             $scope.postsweeks = response.data;
//         })
//     }
//     $scope.getPostsLastWeeks = function(){
//         $http.get('/home/getpostslastweeks').then((response)=>{
//             $scope.postslastweeks = response.data;
//         })
//     }
//     $scope.getPost = function(){
//         var url = new URL(window.location.href);
//         var meta = url.pathname.split('/');
//         $http({
//             method:'post',
//             url: '/home/getonepost',
//             data: {metatitle: meta[2]}
//         }).then((response)=>{
//             console.log(response.data);
//             $scope.mainpost = response.data[0];
//             $scope.postsbycate = response.data[1].data;
//             $('#fh5co-title-box').css('background-image','url(/storage/uploads/posts/'+$scope.mainpost.author_id+'/'+$scope.mainpost.image);
//         })
//     }
//     $scope.pagemore = 1;
//     $scope.loading = false;
//     $scope.getmore = function(){   
//         $scope.loading = true;  
//         $scope.pagemore++;  
//         $http({
//             method:'post',
//             url: '/home/showmore',
//             data: {cate: $scope.mainpost.small_category_id, page: $scope.pagemore}
//         }).then((response)=>{
//             console.log(response.data);         
//             $scope.postsbycate.push(response.data[0].data[0]);
//             $scope.pagemore = response.data[0].current_page;
//             if($scope.pagemore == response.data[0].last_page)
//                 $('#more').hide();
//             $scope.loading = false;
//             console.log($scope.postsbycate);
//         })
//     }
//     $scope.getPostsByCategory = function(){
//         var url = new URL(window.location.href);
//         var meta = url.pathname.split('/');
//         var page = url.searchParams.get('page');
//         console.log(page);
//         $http({
//             method:'post',
//             url: '/home/getpostsbycategory',
//             data: {metatitle: meta[2],page:page}
//         }).then((response)=>{
//             $scope.posts = response.data[0].data;
//             $('#paginate').html(response.data[1]);
//         })
//     }
//     $scope.getPostsBySmallCategory = function(){
//         var url = new URL(window.location.href);
//         var meta = url.pathname.split('/');
//         var page = url.searchParams.get('page');
//         console.log(meta);
//         $http({
//             method:'post',
//             url: '/home/getpostsbysmallcategory',
//             data: {metatitle: meta[3],page:page}
//         }).then((response)=>{
//             $scope.posts = response.data[0].data;
//             $('#paginate').html(response.data[1]);
//         })
//     }
//     $scope.search = function(){
//         if(!$scope.searchtxt)
//         return;
//         else
//         window.location = 'http://localhost:8000/search?keyword='+$scope.searchtxt;

//     }

// })
app.controller('homecontroller', function ($scope, $http) {
    $scope.getauth = function () {
        $scope.user = JSON.parse(localStorage.getItem('user')) ?? null;

    }
    $scope.getauth();
    $scope.logout = function () {
        $('#logout').bind('click', () => {
            localStorage.removeItem('user');
            window.location.href = 'index.html';
        })

    }
    $scope.getBannerPosts = function () {
        $http({
            method: 'post',
            url: api_url + 'post/get-post-banners',
            data: { pageSize: 5, page: 1 },
            // headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            console.log(response.data);
            $scope.firstpost = response.data.data[0];
            $scope.bannerposts = response.data.data;
            $scope.bannerposts.shift();
            console.log($scope.firstpost, $scope.bannerposts);
        });
    }
    $scope.pageSize = 5;
    $scope.pageIndex = 1;
    $scope.getHomePosts = function () {
        var url = new URL(window.location.href);
        var page = parseInt(url.searchParams.get('page'));
        if (!page)
            page = 1;
        $http({
            method: 'post',
            url: api_url + 'post/get-post-home',
            data: { pageSize: $scope.pageSize, page: page },
            // headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            console.log(response.data);
            $scope.posts = response.data.data;
            $scope.totalPages = Math.ceil(response.data.totalItems / response.data.pageSize);
            $scope.currentPage = page;
            var pages = [];
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
            // $('#paginate').html(`
            // <a class='btn_pagging activee' href='?page=1'>1</a>
            // <a class='btn_pagging' href='?page=2'>2</a>
            // <a class='btn_pagging' href='?page=3'>3</a>
            // <a class='btn_pagging' href='?page=2'>Next</a>`);
            // $scope.first = response.data[0];
            // $scope.banners = $scope.
        });
    }
    $scope.getHomePosts();
    $scope.getCategories = function () {
        $http({
            method: 'get',
            url: api_url + 'smallcategory/get-all'
            // headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            console.log(response.data);
            $scope.categories = response.data;
        });
    }
    $scope.getPostsWeeks = function () {
        $http({
            method: 'post',
            url: api_url + 'post/get-post-thisweek',
            data: { pageSize: $scope.pageSize, page: $scope.pageIndex },
        }).then((response) => {
            console.log(response.data);
            $scope.postsweek = response.data.data;
        });
    }
    $scope.getPostsLastWeeks = function () {
        $http({
            method: 'post',
            url: api_url + 'post/get-post-lastweek',
            data: { pageSize: $scope.pageSize, page: $scope.pageIndex },
        }).then((response) => {
            console.log(response.data);
            $scope.postslastweek = response.data.data;
        });
    }
    $scope.getPost = function () {
        var url = new URL(window.location.href);
        var meta = url.searchParams.get('meta');
        console.log(meta);
        $http({
            method: 'get',
            url: api_url +'post/get-by-meta?meta='+meta
        }).then((response) => {
            console.log(response.data);
            $scope.mainpost = response.data;         
            //$scope.postsbycate = response.data[1].data;
            if($scope.mainpost != null)
            $scope.getmore();
            $('#fh5co-title-box').css('background-image', 'url(/storage/uploads2'+ $scope.mainpost.image);
        })
    }
    $scope.same_page = 1;
    $scope.same_pageSize = 1;
    $scope.getmore = function(){
        $scope.same_page++;
        $http({
            method: 'post',
            url: api_url +'post/get-post-same',
            data: {page: $scope.same_page, pageSize: $scope.same_pageSize, small_category: $scope.mainpost.small_category_id ? $scope.mainpost.small_category_id : ''}
        }).then((response) => {
            console.log(response.data);
            if($scope.postsbycate == null)
            $scope.postsbycate = response.data.data;
            else
            //$scope.mainpost = response.data;
            $scope.postsbycate.push(response.data.data[0]);
           
            // $('#fh5co-title-box').css('background-image', 'url(/storage/uploads2'+ $scope.mainpost.image);
        })
    }
    
    $scope.getCategoryPost = function () {
        var url = new URL(window.location.href);
        var category = url.searchParams.get('category');
        var page = url.searchParams.get('page');
        if(!page)
            page = 1;
        console.log(category,page);
        $http({
            method: 'post',
            url: api_url +'post/get-post-category',
            data: {page: page, pageSize: 10, category: category}
        }).then((response) => {
            console.log(response.data);
           $scope.maincategory = response.data.data[0].small_category_title;
           $scope.postss = response.data.data;
           $scope.totalPages = Math.ceil(response.data.totalItems / response.data.pageSize);
            $scope.currentPage = page;
            var pages = [];
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
        })
    }
})