
// app.filter('unsafe', function ($sce) {
//     return $sce.trustAsHtml;
// });
// app.controller('managercontroller', function ($http, $scope, $sce, $location, $filter) {
//     $scope.safeHTML = function (text) {
//         return $sce.trustAsHtml(text);
//     }
//     $scope.baseURL = '/storage/uploads/';
//     $scope.imageSource = '';
//     $scope.loading = true;
//     $scope.file = '';
//     $scope.loadbar = false;
//     $scope.post = {};
//     $scope.userInfo = function () {
//         $http.get('/user/api/userinfo').then((response) => {
//             $scope.loading = false;
//             $scope.user = response.data;
//             if ($scope.user.avatar == 'profile.png') {
//                 $scope.baseURL += 'default_profile/';
//                 $scope.imageSource = $scope.baseURL + $scope.user.avatar;
//             } else {
//                 $scope.baseURL += $scope.user.id + '/';
//                 $scope.imageSource = $scope.baseURL + $scope.user.avatar;
//             }
//             $('#thongtin').show()
//         })
//     }

//     $scope.confirm = function () {
//         const formData = new FormData();
//         formData.append('file', $scope.file);
//         //$scope.loading = true;
//         $scope.loadbar = true;
//         $('#loadText').text('Đang tải...');
//         $http({
//             method: 'post',
//             url: '/user/api/changeavatar',
//             transformRequest: angular.identity,
//             headers: {
//                 'Content-Type': undefined,
//                 'Process-Data': false
//             },
//             data: formData,
//             uploadEventHandlers: {
//                 progress: function (e) {
//                     if (e.lengthComputable) {
//                         $scope.loadbar = true;
//                         $scope.progressBar = (e.loaded / e.total) * 100;
//                         $scope.progressCounter = $scope.progressBar.toFixed(2) + ' %';

//                     }
//                 }
//             }
//         }).then((response) => {
//             $scope.loading = false;
//             $scope.loadbar = false;
//             $scope.progressBar = 0;
//             $scope.progressCounter = 0;
//             $('#saveimage').hide();
//             console.log($scope.progressBar, $scope.progressCounter);
//             console.log(response.data);
//         });
//     }
//     $scope.file_changed = function (element) {
//         $('#saveimage').css('display', 'block');
//         var file = element.files[0];
//         $scope.file = file;
//         var reader = new FileReader();
//         reader.onload = (function () {
//             return function (e) {
//                 $scope.imageSource = e.target.result;
//                 $('#avatar').attr('ng-src', $scope.imageSource);
//                 $scope.$apply();
//             };
//         })(file);
//         reader.readAsDataURL(file);
//     }
//     $scope.modalTitle = '';
//     $scope.showModal = function () {
//         //$scope.modalTitle = 'Xem bài viết';
//         // $scope.postform.$setPristine();
//         // $('#addbtn').text('Thêm');
//         //$scope.post = {};
//         // $('#inputUsername').prop('disabled', false);
//         // $('#inputPass').prop('disabled', false);
//         $('#modal').modal('show');
//     }
//     $scope.closeModal = function (index) {
//         // $scope.myform.name.$invalid = false;
//         // $scope.myform.name.$dirty = false;
//         // $scope.myform.address.$invalid = false;
//         // $scope.myform.address.$dirty = false;
//         // $scope.myform.birthday.$invalid = false;
//         // $scope.myform.birthday.$touched = false;
//         // $scope.myform.start_day.$invalid = false;
//         // $scope.myform.start_day.$touched = false;
//         // $scope.myform.username.$invalid = false;
//         // $scope.myform.username.$dirty = false;
//         // $scope.myform.email.$invalid = false;
//         // $scope.myform.email.$dirty = false;
//         // $scope.myform.password.$invalid = false;
//         // $scope.myform.password.$dirty = false;
//         // $scope.myform.phone.$invalid = false;
//         // $scope.myform.phone.$dirty = false;
//         // $scope.myform.gender.$invalid = false;
//         // $scope.myform.gender.$touched = false;
//         // $scope.myform.job.$invalid = false;
//         // $scope.myform.job.$touched = false;
//         //$scope.categoryform.$setPristine();
//         // $scope.myform.birthday.$pristine = true;
//         // $scope.myform.birthday.$touched = false;
//         // $scope.myform.gender.$pristine = true;
//         // $scope.myform.gender.$touched = false;
//         // $scope.myform.start_day.$pristine = true;
//         // $scope.myform.start_day.$touched = false;
//         // $scope.myform.job.$pristine = true;
//         // $scope.myform.job.$touched = false;
//         $('#modal'+index).modal('hide');
//     }
//     $scope.addStaff = function () {
//         $scope.loading = true;
//         $http({
//             method: 'post',
//             url: '/user/admin/api/staffmanage',
//             data: $scope.staff,

//         }).then((response) => {
//             $scope.staff = {};
//             $scope.loading = false;
//             $scope.getItems();
//             $scope.closeModal();
//         });
//     }
//     $scope.watch = false;
//     $scope.update = false;

//     $scope.convertTZ = function(date, tzString) {
//         console.log('hi');
//         return new Date((typeof date === "string" ? new Date(date) : date).toLocaleString("en-US", {timeZone: tzString}));   
//     }
//     $scope.showPost = function (id) {  
//         $scope.modalTitle = 'Xem bài viết';
//         $scope.watch=true;
//         $('.modal-footer').hide();
//        CKEDITOR.instances['editor1'].setReadOnly(true);
//        CKEDITOR.instances['editor2'].setReadOnly(true);   
//         $scope.posts.forEach(post => {
//             if(post.id==id){
//                 $scope.post = post;
//                 $scope.big_category = $scope.post.small_category.category.id;
//                 $scope.imageSource = $scope.baseURL+"posts/"+ $scope.post.author.id+"/" + $scope.post.image;
//                 var date = new Date($scope.post.created_at);
//                 $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");
//                 //$scope.changeCategory();
//                 $http({
//                     method: 'post',
//                     url: '/user/staff/api/getsmallcategories',
//                     data: { big_category: $scope.big_category }
//                 }).then((response) => {
//                     $scope.smallcategories = response.data;
//                     // $scope.post.small_category = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
//                     // if ($scope.post.small_category == '')
//                     //     $('#uppost').prop('disabled', true);
//                     // else $('#uppost').prop('disabled', false);
//                     console.log(response.data);
//                 })
//             }              
//         });
//         //$scope.showModal();
//     }
//     $scope.feed = {};
//     $scope.showPost2 = function (id) {  
//         $('.modal-footer').show();
//         $scope.modalTitle  = 'Từ chối bài viết';
//         $('#addbtn').text('Gửi');
//         $('#modal2').modal('show');
//         $scope.feed.post_id = id;
//     }
//     $scope.showPost3 = function (id) {  
//         $scope.watch=false;
//         $('.modal-footer').show();
//         $scope.modalTitle  = 'Sửa bài viết';
//         $('#addbtn').text('Sửa');
//        CKEDITOR.instances['editor1'].setReadOnly(false);
//        CKEDITOR.instances['editor2'].setReadOnly(false);   
//         $scope.posts.forEach(post => {
//             if(post.id==id){
//                 $scope.post = post;
//                 $scope.big_category = $scope.post.small_category.category.id;
//                 $scope.imageSource = $scope.baseURL+"posts/"+ $scope.post.author.id+"/" + $scope.post.image;
//                 $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");
//                 //$scope.changeCategory();
//                 $http({
//                     method: 'post',
//                     url: '/user/manager/api/getsmallcategories',
//                     data: { big_category: $scope.big_category }
//                 }).then((response) => {
//                     $scope.smallcategories = response.data;
//                     // $scope.post.small_category = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
//                     // if ($scope.post.small_category == '')
//                     //     $('#uppost').prop('disabled', true);
//                     // else $('#uppost').prop('disabled', false);
//                     console.log(response.data);
//                 })
//             }              
//         });
//         //$scope.showModal();
//     }
//     $scope.acceptPost = function(id){
//         if(confirm('Bạn có chắc muốn duyệt?'))
//         $http({
//             method:'post',
//             url:'/user/manager/api/acceptpost',
//             data:{id:id}
//         }).then((response)=>{
//             alert('Duyệt thành công');
//             $scope.getPendingPosts();
//             $scope.closeModal('');
//         })
//     }
//     $scope.sendFeed = function(id){
//         console.log($scope.feed);
//         $http({
//             method:'post',
//             url:'/user/manager/api/sendfeed',
//             data:{feed:$scope.feed}
//         }).then((response)=>{
//             alert('Đã từ chối');
//             $scope.getPendingPosts();
//             $scope.closeModal(2);
//             $scope.feedform.$setPristine();
//             for (instance in CKEDITOR.instances) {
//                 CKEDITOR.instances[instance].updateElement();
//                 CKEDITOR.instances[instance].setData('');
//             }
//             $scope.feed ={};
//         })
//     }
//     $scope.execute = function () {
//         if ($('#addbtn').text() == 'Thêm')
//             $scope.addCategory();
//         else $scope.updateCategory();
//         //$scope.myform.$setPristine();
//     }

//     $scope.updatePost = function () {
//         const formData = new FormData();
//         formData.append('file', $scope.file);
//         var post = JSON.stringify($scope.post);
//         formData.append('post', post);
//         $http({
//             method: 'post',
//             url: '/user/manager/api/updatepost',
//             transformRequest: angular.identity,
//             headers: {
//                 'Content-Type': undefined,
//             },
//             data: formData
//         }).then((response) => {
//             alert('Sửa thành công. Chờ duyệt...');
//             $scope.post = {};
//             //$scope.postform.$setPristine();
//             //$scope.post.dateup = $scope.currentTime();
//             //$scope.file = '';
//             //$scope.imageSource = '';
//             //$('#banner').attr('src', '');          
//             $scope.getPosts();
//             $scope.loading = false;
//             $scope.closeModal('');
//         })
//         //$scope.loading = true;
//         console.log($scope.post);
//         // $http({
//         //     method: 'post',
//         //     url: '/user/admin/api/updatepost',
//         //     data: $scope.post,
//         // }).then((response) => {
//         //     $scope.getItems();
//         //     $scope.loading = false;
//         //     $scope.closeModal();
//         // })
//     }
//     $scope.deletePost = function (id) {
//         if (confirm('Bạn có chắc muốn xóa?'))
//             $http({
//                 method: 'post',
//                 url: '/user/manager/api/deletepost',
//                 data: { id: id },
//             }).then((response) => {
//                 console.log(response.data);
//                 $scope.getPosts();
//                 $scope.loading = false;
//             })

//     }
//     $scope.restorePost = function (id) {
//         if (confirm('Bạn có chắc muốn khôi phục bài viết?'))
//             $http({
//                 method: 'post',
//                 url: '/user/manager/api/restorepost',
//                 data: { id: id },
//             }).then((response) => {
//                 console.log(response.data);
//                 $scope.getPosts();
//                 $scope.loading = false;
//             })

//     }
//     $scope.uppost = function () {
//         $scope.post.dateup = $scope.currentTime();
//         const formData = new FormData();
//         formData.append('file', $scope.file);
//         var post = JSON.stringify($scope.post);
//         formData.append('post', post);
//         $http({
//             method: 'post',
//             url: '/user/staff/api/uppost',
//             transformRequest: angular.identity,
//             headers: {
//                 'Content-Type': undefined,
//             },
//             data: formData
//         }).then((response) => {
//             alert('Đăng thành công. Chờ duyệt...');
//             $scope.post = {};
//             $scope.postform.$setPristine();
//             $scope.post.dateup = $scope.currentTime();
//             $scope.file = '';
//             $scope.imageSource = '';
//             $('#banner').attr('src', '');
//             for (instance in CKEDITOR.instances) {
//                 CKEDITOR.instances[instance].updateElement();
//                 CKEDITOR.instances[instance].setData('');
//             }

//         })
//     }
//     $scope.showModal2 = function(id){
//         $scope.modalTitle = "Sửa thể loại";
//         $scope.watch = false;
//         $scope.update = true;
//         $scope.smallcategories.forEach(small => {
//             if(small.id==id)
//                 $scope.small_category = small;
//         });
//         $('#modal2').modal('show');
//     }
//     $scope.showModal4 = function(){
//         $scope.modalTitle = "Sửa thể loại";
//         $scope.watch = true;
//         $scope.update = true;
//         $('#modal3').modal('show');
//     }
//     $scope.showModal3 = function(){
//         $scope.modalTitle = "Thêm thể loại";
//         $scope.update = false;
//         $scope.watch = false;
//         //$scope.category = {};
//         $scope.small_category = {};
//         $scope.categoryform.$setPristine();
//         $('#modal1').modal('show');
//     }

//     $scope.category ={};
//     $scope.small_category = {};
//     $scope.loadBigCategories = function () {
//         $http.get('/user/manager/api/getbigcategories').then((response) => {
//             $scope.bigcategories = response.data;
//             //$scope.category.id = response.data[0].id;
//             //$scope.category.description = $scope.bigcategories[0].description;
//             $scope.changeCategory();        
//             $('#cgr').show();
//         })
//     }
//     $scope.loadDescription = function(){
//         $scope.bigcategories.forEach(category => {
//             if(category.id==$scope.category.id){
//                 $scope.category.description = category.description;
//                 $scope.category.title = category.title;
//                 $scope.category.metatitle = category.metatitle;
//             }

//         });
//         $scope.smallcategories.forEach(small => {
//             if(small.id==$scope.small_category.id){
//                 $scope.small_category.description = small.description;
//                 $scope.small_category.title = small.title;
//                 $scope.small_category.metatitle = small.metatitle;
//             }

//         });
//         console.log($scope.category,$scope.small_category);
//     }
//     $scope.changeCategory = function () {
//         $http({
//             method: 'post',
//             url: '/user/manager/api/getsmallcategories',
//             data: { big_category: $scope.category.id }
//         }).then((response) => {
//             $scope.smallcategories = response.data;
//             $scope.small_category.id = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
//             // if ($scope.post.small_category == '')
//             //     $('#uppost').prop('disabled', true);
//             // else $('#uppost').prop('disabled', false);
//             $scope.loadDescription();
//             $scope.loading = false;
//             console.log(response.data);
//         })
//     }
//     $scope.addCategory = function(){
//         $scope.small_category.category_id = $scope.category.id;
//         console.log($scope.category,$scope.small_category);
//         $http({
//             method:'post',
//             url:'/user/manager/api/addcategory',
//             data:{category:$scope.category,small_category:$scope.small_category},

//         }).then((response)=>{
//             $scope.loadBigCategories();
//             $scope.closeModal(1);
//         });
//     }
//     $scope.updateSmallCategory = function(){
//         $scope.small_category.category_id = $scope.category.id;
//         console.log($scope.category,$scope.small_category);
//         $http({
//             method:'post',
//             url:'/user/manager/api/updatesmallcategory',
//             data:{small_category:$scope.small_category},

//         }).then((response)=>{
//             $scope.loadBigCategories();
//             $scope.closeModal(2);
//         });
//     }
//     $scope.updateBigCategory = function(){
//         $http({
//             method:'post',
//             url:'/user/manager/api/updatebigcategory',
//             data:{category:$scope.category},

//         }).then((response)=>{
//             $scope.loadBigCategories();
//             $scope.closeModal(3);
//         });
//     }
//     $scope.posts = [];
//     $scope.totalPages = 0;
//     $scope.currentPage = 1;
//     $scope.itemPerPage = 10;
//     $scope.range = [];

//     $scope.sorting = function(){
//         var url = new URL(window.location.href);
//         var orderBy = url.searchParams.get('orderBy');   
//         if(!orderBy){
//             url.searchParams.append('orderBy',$scope.orderBy);
//         }
//         else
//             url.searchParams.set('orderBy',$scope.orderBy);
//         window.location = url.href;
//     }

//     $scope.getItems = function () {
//         $scope.loading = true;
//         //var pageNumber =$location.search().page;
//         // if(!pageNumber)
//         //     pageNumber = 1;
//         var url = new URL(window.location.href);
//         var pageNumber = parseInt(url.searchParams.get("page"));
//         var orderBy = url.searchParams.get("orderBy");
//         $scope.orderBy = orderBy;
//         if(!orderBy)
//             $scope.orderBy = 'newest';
//         console.log(orderBy);
//         if (!pageNumber)
//             pageNumber = 1;
//         $http.get('/user/staff/api/getmyposts' + '?page=' + pageNumber +'&orderBy='+orderBy).then(function (response) {
//             $scope.posts = response.data[0].data;

//             if ($scope.posts == '')
//                 $('#tableposts').html('Không có dữ liệu');
//             $scope.totalPages = response.data[0].last_page;
//             $scope.currentPage = response.data[0].current_page;
//             var pages = [];
//             for (var i = 1; i <= response.data[0].last_page; i++) {
//                 pages.push(i);
//             }
//             $scope.range = pages;
//             CKEDITOR.on('instanceReady', function() { $scope.loading = false;$('#main').show(); });

//             $('.pagination').html(response.data[1]);
//             console.log(response.data);

//         });
//     };

//     $scope.currentTime = function () {
//         var today = new Date();
//         var date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear() + ' ' + today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds();
//         $scope.post.dateup = date;
//         return date;
//     }

//     $scope.getFile = function () {
//         var reader = new FileReader();
//         reader.onload = (function () {
//             return function (e) {
//                 $scope.imageSource = e.target.result;
//                 $('#avatar').attr('ng-src', $scope.imageSource);
//                 $scope.$apply();
//                 $('#saveimage').css('display', 'block');
//             };
//         })($scope.file);
//         reader.readAsDataURL($scope.file);
//         // fileReader.readAsDataUrl($scope.file, $scope)
//         //     .then(function (result) {
//         //         $scope.imageSource = result;
//         //         $('#saveimage').css('display', 'block');
//         //     });
//     };
//     $scope.getPendingPosts = function () {
//         $scope.itemPerPage = 4;
//         $scope.loading = true;
//         //var pageNumber =$location.search().page;
//         // if(!pageNumber)
//         //     pageNumber = 1;
//         var url = new URL(window.location.href);
//         var pageNumber = parseInt(url.searchParams.get("page"));
//         if (!pageNumber)
//             pageNumber = 1;
//         $http.get('/user/manager/api/getpendingposts' + '?page=' + pageNumber).then(function (response) {
//             console.log(response.data);
//             $scope.posts = response.data[0].data;  
//             if ($scope.posts == '')
//                 $('#tableposts').html('Không có dữ liệu');
//             else $('#tableposts').show()
//             $scope.totalPages = response.data[0].last_page;
//             $scope.currentPage = response.data[0].current_page;
//             var pages = [];
//             for (var i = 1; i <= response.data[0].last_page; i++) {
//                 pages.push(i);
//             }
//             $scope.range = pages;
//             $scope.loading = false;$('#main').show();
//             CKEDITOR.on('instanceReady', function() {  });

//             $('.pagination').html(response.data[1]);
//             console.log(response.data);

//         });
//     };
//     $scope.getPosts = function () {
//         $scope.itemPerPage = 4;
//         $scope.loading = true;
//         //var pageNumber =$location.search().page;
//         // if(!pageNumber)
//         //     pageNumber = 1;
//         var url = new URL(window.location.href);
//         var pageNumber = parseInt(url.searchParams.get("page"));
//         if (!pageNumber)
//             pageNumber = 1;
//         $http.get('/user/manager/api/getallposts' + '?page=' + pageNumber).then(function (response) {
//             console.log(response.data);
//             $scope.posts = response.data[0].data;  
//             if ($scope.posts == '')
//                 $('#tableposts').html('Không có dữ liệu');
//             else $('#tableposts').show()
//             $scope.totalPages = response.data[0].last_page;
//             $scope.currentPage = response.data[0].current_page;
//             var pages = [];
//             for (var i = 1; i <= response.data[0].last_page; i++) {
//                 pages.push(i);
//             }
//             $scope.range = pages;
//             $scope.loading = false;$('#main').show();
//             CKEDITOR.on('instanceReady', function() {  });

//             $('.pagination').html(response.data[1]);
//             console.log(response.data);

//         });
//     };
//     $scope.showPost = function (id) {  
//         $scope.modalTitle = 'Xem bài viết';
//         $scope.watch=true;
//         $('.modal-footer').hide();
//        CKEDITOR.instances['editor1'].setReadOnly(true);    
//        CKEDITOR.instances['editor2'].setReadOnly(true);   
//         $scope.posts.forEach(post => {
//             if(post.id==id){
//                 $scope.post = post;
//                 $scope.big_category = $scope.post.small_category.category.id;
//                 $scope.imageSource = $scope.baseURL+"posts/"+ $scope.post.author.id+"/" + $scope.post.image;
//                 var date = new Date($scope.post.created_at);
//                 $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");
//                 $scope.post.updated_at = moment($scope.post.updated_at).format("DD/MM/YYYY H:mm:ss");
//                 //$scope.changeCategory();
//                 $http({
//                     method: 'post',
//                     url: '/user/manager/api/getsmallcategories',
//                     data: { big_category: $scope.big_category }
//                 }).then((response) => {
//                     $scope.smallcategories = response.data;
//                     // $scope.post.small_category = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
//                     // if ($scope.post.small_category == '')
//                     //     $('#uppost').prop('disabled', true);
//                     // else $('#uppost').prop('disabled', false);
//                     console.log(response.data);
//                 })
//             }              
//         });
//         //$scope.showModal();
//     }
// })
app.controller('managercontroller', function ($scope, $http, $location) {
    $scope.logout = function () {
        localStorage.removeItem('user');
        window.location.href = 'index.html';
        $('#logout').bind('click', () => {

        })

    }
    $scope.user = JSON.parse(localStorage.getItem('user')) ?? null;
    if (!$scope.user) window.location.href = 'index.html';
    $scope.checkrole = function () {
        var url = $location.absUrl();
        var array = url.split('/');
        var role = array[3].toString().split('-')[1].toString().split('.');
        console.log(role[0]);
        if ($scope.user.role.toLowerCase() == role[0])
            return;
        else
            window.location.href = 'index.html';
    }
    $scope.checkrole();
    $scope.userInfo = function () {
        $http({
            method: 'get',
            url: api_url + 'users/get-by-id/' + $scope.user.id,
            headers: {
                'Authorization': 'Bearer ' + $scope.user.token
            }
        }).then((response) => {
            $scope.user = response.data;
            console.log(response.data);
        })
    }
    $scope.totalPages = 0;
    $scope.currentPage = 1;
    $scope.itemPerPage = 3;
    $scope.getItems = function () {
        var param = $location.search();
        var pageNumber = param.page;
        console.log(param);
        if (!pageNumber)
            pageNumber = 1;
        $http({
            method: 'post',
            url: api_url + 'post/get-pending-posts',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { page: pageNumber, pageSize: $scope.itemPerPage }
        }).then((response) => {
            console.log(response.data);
            $scope.posts = response.data.data;
            $scope.posts.forEach(post => {
                post.created_at = moment(post.created_at).format("DD/MM/YYYY H:mm:ss");
            });
            var pages = [];
            $scope.totalPages = Math.ceil(response.data.totalItems / response.data.pageSize);
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
            $scope.currentPage = pageNumber;
        }).catch((error) => {
            console.log(error);
        })
    }
    //$scope.getItems();
    $scope.getUrl = function (page) {
        // var url = new URL(window.location.href);
        // var pageNumber = url.searchParams.get('page');   
        // if(!pageNumber){
        //     // url.searchParams.append('page',page);
        //     $location.search({'page':page});
        // }
        // else
        //     url.searchParams.set('page',page);
        var param = $location.search();
        var pageNumber = param.page;
        $location.search({ 'page': page });
        //if(!pageNumber)


        $scope.getItems();
        //window.location = url.href;
    }
    $scope.showModal = function () {
        $scope.modalTitle = 'Sửa bài viết';
        //$scope.myform.$setPristine();
        $('#addbtn').text('Sửa');
        $scope.staff = {};
        $('#inputUsername').prop('disabled', false);
        $('#inputPass').prop('disabled', false);
        $('#modal').modal('show');
    }
    $scope.closeModal = function () {
        $scope.myform.$setPristine();
        // $scope.myform.birthday.$pristine = true;
        // $scope.myform.birthday.$touched = false;
        // $scope.myform.gender.$pristine = true;
        // $scope.myform.gender.$touched = false;
        // $scope.myform.start_day.$pristine = true;
        // $scope.myform.start_day.$touched = false;
        // $scope.myform.job.$pristine = true;
        // $scope.myform.job.$touched = false;
        $('#modal').modal('hide');
    }
    $scope.execute = function () {
        if ($('#addbtn').text() == 'Thêm')
            $scope.addStaff();
        else $scope.updateStaff();
        $scope.myform.$setPristine();
    }
    $scope.currentTime = function () {
        var today = new Date();
        var date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear() + ' ' + today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds();
        $scope.dateup = date;
        return date;
    }
    $scope.loadBigCategories = function () {
        $http({
            method: 'get',
            url: api_url + 'category/get-all',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            console.log(response.data);
            $scope.bigcategories = response.data;
            $scope.big_category = response.data[0].id;
            $scope.changeCategory();
        })
        // $http.get('/user/staff/api/getbigcategories').then((response) => {
        //     $scope.bigcategories = response.data;
        //     $scope.big_category = response.data[0].id;
        //     $scope.changeCategory();
        //     $scope.loading = false;
        //     $('#postup').show();
        // })
    }
    $scope.changeCategory = function () {
        console.log($scope.bigcategories);
        $http({
            method: 'post',
            url: api_url + 'category/get-smallcategory',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { id: $scope.big_category }
        }).then((response) => {
            $scope.smallcategories = response.data;
            $scope.post.small_category_id = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        })
    }
    $scope.uppost = function (event) {
        event.preventDefault();
        const formData = new FormData();
        formData.append('file', $scope.file);
        $scope.post.author = $scope.user.id;
        var post = JSON.stringify($scope.post);
        //formData.append('post', post);
        $http({
            method: 'post',
            url: api_url + 'post/upload',
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'Authorization': 'Bearer ' + $scope.user.token
            },
            data: formData
        }).then((response) => {
            console.log(response.data);
            $scope.post.image = response.data.filePath;
            $http({
                method: 'post',
                url: api_url + 'post/create-post',
                headers: {
                    'Authorization': 'Bearer ' + $scope.user.token
                },
                data: JSON.stringify($scope.post)
            }).then((response) => {
                alert('Đăng thành công. Chờ duyệt...');
                console.log(response.data);
            })

            // $scope.post = {};
            // $scope.postform.$setPristine();
            // $scope.post.dateup = $scope.currentTime();
            // $scope.file = '';
            // $scope.imageSource = '';
            // $('#banner').attr('src', '');
            // for (instance in CKEDITOR.instances) {
            //     CKEDITOR.instances[instance].updateElement();
            //     CKEDITOR.instances[instance].setData('');
            // }

        }).catch((error) => {
            console.log(error);
        })
    }
    $scope.getFile = function () {
        var reader = new FileReader();
        reader.onload = (function () {
            return function (e) {
                $scope.imageSource = e.target.result;
                //$('#avatar').attr('ng-src', $scope.imageSource);
                $scope.$apply();
                //$('#saveimage').css('display', 'block');
            };
        })($scope.file);
        reader.readAsDataURL($scope.file);

    };
    $scope.showPost = function (id) {
        $scope.modalTitle = 'Xem bài viết';
        $('#modal').modal('show');
        $scope.watch = true;
        $('.modal-footer').hide();
        CKEDITOR.instances['editor1'].setReadOnly(true);
        CKEDITOR.instances['editor2'].setReadOnly(true);
        $scope.posts.forEach(post => {
            if (post.id == id) {
                $scope.post = post;
                $scope.big_category = $scope.post.big_category_id;
                $scope.imageSource = '/storage/uploads2' + $scope.post.image;
                console.log($scope.post);
                $scope.changeCategory();
                // $http({
                //     method: 'post',
                //     url: api_url +'category/get-smallcategory',
                //     headers:{'Authorization':'Bearer '+$scope.user.token},
                //     data: { big_category: $scope.big_category }
                // }).then((response) => {
                //     $scope.smallcategories = response.data;
                //     // $scope.post.small_category = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
                //     // if ($scope.post.small_category == '')
                //     //     $('#uppost').prop('disabled', true);
                //     // else $('#uppost').prop('disabled', false);
                //     console.log(response.data);
                // })
            }
        });
        //$scope.showModal();
    }
    $scope.showPost2 = function (id) {
        $scope.feed = {};
        $('.modal-footer').show();
        $scope.modalTitle = 'Từ chối bài viết';
        $('#addbtn').text('Gửi');
        $('#modal2').modal('show');
        $scope.feed.post_id = id;
    }
    $scope.showPost3 = function (id) {
        $scope.watch = false;
        $('.modal-footer').show();
        $scope.modalTitle = 'Sửa bài viết';
        $('#addbtn').text('Sửa');
        CKEDITOR.instances['editor1'].setReadOnly(false);
        CKEDITOR.instances['editor2'].setReadOnly(false);
        $scope.posts.forEach(post => {
            if (post.id == id) {
                $scope.post = post;
                $scope.big_category = $scope.post.big_category_id;
                $scope.imageSource = '/storage/uploads2' + $scope.post.image;
                console.log($scope.post);
                $scope.changeCategory();
            }
        });
        //$scope.showModal();
    }
    $scope.sendFeed = function (id) {
        $scope.feed.user_id = $scope.user.id;
        console.log($scope.feed);
        $http({
            method: 'post',
            url: api_url + 'post/decline-post',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { id: $scope.feed.post_id, user_id: $scope.user.id, content: $scope.feed.content }
        }).then((response) => {
            alert('Đã từ chối');
            $scope.getPendingPosts();
            //$scope.closeModal(2);
            $('#modal2').modal('hide');
            $scope.feedform.$setPristine();
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
                CKEDITOR.instances[instance].setData('');
            }
            $scope.feed = {};
        })
    }
    $scope.updatePost = function () {
        const formData = new FormData();
        var post = JSON.stringify($scope.post);
        console.log(post);
        $scope.post.created_at = moment().format();
        //return;
        if ($scope.file) {
            formData.append('file', $scope.file);
            var post = JSON.stringify($scope.post);
            //formData.append('post', post);
            $http({
                method: 'post',
                url: api_url + 'post/upload',
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined,
                    'Authorization': 'Bearer ' + $scope.user.token
                },
                data: formData
            }).then((response) => {
                console.log(response.data);
                $scope.post.image = response.data.filePath;
                $http({
                    method: 'post',
                    url: api_url + 'post/update-post',
                    headers: {
                        'Authorization': 'Bearer ' + $scope.user.token
                    },
                    data: JSON.stringify($scope.post)
                }).then((response) => {
                    alert('Đăng thành công. Chờ duyệt...');
                    $scope.getItems();
                    $scope.closeModal();
                    console.log(response.data);
                })
                //$scope.postform.$setPristine();
                //$scope.post.dateup = $scope.currentTime();
                //$scope.file = '';
                //$scope.imageSource = '';
                //$('#banner').attr('src', '');          

            })
            //$scope.loading = true;
            console.log($scope.post);
            // $http({
            //     method: 'post',
            //     url: '/user/admin/api/updatepost',
            //     data: $scope.post,
            // }).then((response) => {
            //     $scope.getItems();
            //     $scope.loading = false;
            //     $scope.closeModal();
            // })
        }
        else {
            $http({
                method: 'post',
                url: api_url + 'post/update-post',
                headers: {
                    'Authorization': 'Bearer ' + $scope.user.token
                },
                data: JSON.stringify($scope.post)
            }).then((response) => {
                alert('Đăng thành công. Chờ duyệt...');
                $scope.getItems();
                $('#modal').modal('hide');
                console.log(response.data);
            })
        }

    }
    $scope.updatePost2 = function () {
        const formData = new FormData();
        var post = JSON.stringify($scope.post);
        console.log(post);
        $scope.post.created_at = moment().format();
        //return;
        if ($scope.file) {
            formData.append('file', $scope.file);
            var post = JSON.stringify($scope.post);
            //formData.append('post', post);
            $http({
                method: 'post',
                url: api_url + 'post/upload',
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined,
                    'Authorization': 'Bearer ' + $scope.user.token
                },
                data: formData
            }).then((response) => {
                console.log(response.data);
                $scope.post.image = response.data.filePath;
                $http({
                    method: 'post',
                    url: api_url + 'post/update-post-manager',
                    headers: {
                        'Authorization': 'Bearer ' + $scope.user.token
                    },
                    data: JSON.stringify($scope.post)
                }).then((response) => {
                    alert('Sửa thành công.');
                    $scope.getPosts();
                    $scope.closeModal();
                    console.log(response.data);
                })
                //$scope.postform.$setPristine();
                //$scope.post.dateup = $scope.currentTime();
                //$scope.file = '';
                //$scope.imageSource = '';
                //$('#banner').attr('src', '');          

            })
            //$scope.loading = true;
            console.log($scope.post);
            // $http({
            //     method: 'post',
            //     url: '/user/admin/api/updatepost',
            //     data: $scope.post,
            // }).then((response) => {
            //     $scope.getItems();
            //     $scope.loading = false;
            //     $scope.closeModal();
            // })
        }
        else {
            $http({
                method: 'post',
                url: api_url + 'post/update-post-manager',
                headers: {
                    'Authorization': 'Bearer ' + $scope.user.token
                },
                data: JSON.stringify($scope.post)
            }).then((response) => {
                alert('Sửa thành công.');
                $scope.getPosts();
                $('#modal').modal('hide');
                console.log(response.data);
            })
        }

    }
    $scope.deletePost = function (id) {
        if (confirm('Bạn có chắc muốn xóa?'))
            $http({
                method: 'post',
                url: api_url + 'post/delete-post',
                headers: { 'Authorization': 'Bearer ' + $scope.user.token },
                data: { id: id },
            }).then((response) => {
                console.log(response.data);
                $scope.getItems();
            })

    }
    $scope.acceptPost = function (id) {
        if (confirm('Bạn có chắc muốn duyệt?'))
            $http({
                method: 'post',
                url: api_url + 'post/accept-post',
                headers: { 'Authorization': 'Bearer ' + $scope.user.token },
                data: { id: id },
            }).then((response) => {
                alert('Duyệt thành công');
                $scope.getPendingPosts();
                $scope.closeModal('');
            })
    }
    $scope.getPendingPosts = function () {
        $scope.itemPerPage = 3;
        $scope.loading = true;
        //var pageNumber =$location.search().page;
        // if(!pageNumber)
        //     pageNumber = 1;
        var url = $location.search();
        var pageNumber = url.page;
        if (!pageNumber)
            pageNumber = 1;
        $http({
            method: 'post',
            url: api_url + 'post/get-pending-posts',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { page: pageNumber, pageSize: $scope.itemPerPage }
        }).then((response) => {
            $scope.posts = response.data.data;
            $scope.posts.forEach(post => {
                post.created_at = moment(post.created_at).format("DD/MM/YYYY H:mm:ss");
            });
            if ($scope.posts == '')
                $('#tableposts').html('Không có dữ liệu');
            else $('#tableposts').show()
            $scope.totalPages = Math.ceil(response.data.totalItems / response.data.pageSize);
            $scope.currentPage = pageNumber;
            var pages = [];
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
            $scope.loading = false; $('#main').show();
            CKEDITOR.on('instanceReady', function () { });

            $('.pagination').html(response.data[1]);
            console.log(response.data);

        })

    };
    $scope.getPosts = function () {
        $scope.itemPerPage = 4;
        //var pageNumber =$location.search().page;
        // if(!pageNumber)
        //     pageNumber = 1;
        var url = $location.search();
        var pageNumber = url.page;
        if (!pageNumber)
            pageNumber = 1;
        $http({
            method: 'post',
            url: api_url + 'post/get-all',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { page: pageNumber, pageSize: $scope.itemPerPage }
        }).then((response) => {
            $scope.posts = response.data.data;
            $scope.posts.forEach(post => {
                post.created_at = moment(post.created_at).format("DD/MM/YYYY H:mm:ss");
            });
            if ($scope.posts == '')
                $('#tableposts').html('Không có dữ liệu');
            else $('#tableposts').show()
            $scope.totalPages = Math.ceil(response.data.totalItems / response.data.pageSize);
            $scope.currentPage = pageNumber;
            var pages = [];
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
            $scope.loading = false; $('#main').show();
            CKEDITOR.on('instanceReady', function () { });

            $('.pagination').html(response.data[1]);
            console.log(response.data);

        })
    };
    $scope.category = {};
    $scope.small_category = {};
    $scope.loadBigCategories = function () {
        $http.get(api_url + 'category/get-all').then((response) => {
            $scope.bigcategories = response.data;
            //$scope.category.id = response.data[0].id;
            //$scope.category.description = $scope.bigcategories[0].description;
            $scope.changeCategory();
            $('#cgr').show();
        })
    }
    $scope.loadDescription = function () {
        $scope.bigcategories.forEach(category => {
            if (category.id == $scope.category.id) {
                $scope.category.description = category.description;
                $scope.category.title = category.title;
                $scope.category.metatitle = category.metatitle;
            }

        });
        $scope.smallcategories.forEach(small => {
            if (small.id == $scope.small_category.id) {
                $scope.small_category.description = small.description;
                $scope.small_category.title = small.title;
                $scope.small_category.metatitle = small.metatitle;
            }

        });
        console.log($scope.category, $scope.small_category);
    }
    $scope.changeCategory2 = function () {
        $http({
            method: 'post',
            url: api_url + 'category/get-smallcategory',
            data: { id: $scope.category.id },
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            $scope.smallcategories = response.data;
            //$scope.small_category.id = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
            // if ($scope.post.small_category == '')
            //     $('#uppost').prop('disabled', true);
            // else $('#uppost').prop('disabled', false);
            $scope.loadDescription();
            $scope.loading = false;
            console.log(response.data);
        })
    }
    $scope.addCategory = function () {
        $scope.small_category.category_id = $scope.category.id;
        $http({
            method: 'post',
            url: api_url + 'category/create-category',
            data: $scope.category,
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            $scope.loadBigCategories();
            $scope.closeModal(1);
        }).catch((error) => {
            console.log(error);
        });
    }
    $scope.addSmallCategory = function () {
        $scope.small_category.category_id = $scope.category.id;
        $http({
            method: 'post',
            url: api_url + 'smallcategory/create-small_category',
            data: $scope.small_category,
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            $scope.changeCategory2();
            $scope.closeModal(1);
        }).catch((error) => {
            console.log(error);
        });
    }
    $scope.updateSmallCategory = function () {
        $scope.small_category.category_id = $scope.category.id;
        console.log($scope.category, $scope.small_category);
        $http({
            method: 'post',
            url: api_url + 'smallcategory/update-small_category',
            data: $scope.small_category,
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            $scope.changeCategory2();
            $scope.closeModal(2);
        });
    }
    $scope.updateBigCategory = function () {
        console.log($scope.category);
        $http({
            method: 'post',
            url: api_url + 'category/update-category',
            data: $scope.category,
            headers: { 'Authorization': 'Bearer ' + $scope.user.token }
        }).then((response) => {
            $scope.changeCategory2();
            $scope.closeModal(3);
        });
    }
    $scope.showModal3 = function () {
        $scope.modalTitle = "Thêm thể loại";
        $scope.update = false;
        $scope.watch = false;
        //$scope.category = {};
        $scope.small_category = {};
        $scope.categoryform.$setPristine();
        $('#modal1').modal('show');
    }
    $scope.showModal5 = function () {
        $scope.modalTitle = "Thêm thể loại";
        $scope.update = false;
        $scope.watch = false;
        //$scope.category = {};    
        $scope.categoryform.$setPristine();
        $scope.small_category = {};
        $('#modal4').modal('show');

    }
    $scope.showModal4 = function () {
        $scope.modalTitle = "Sửa thể loại";
        $scope.watch = true;
        $scope.update = true;
        $('#modal3').modal('show');
    }
    $scope.showModal2 = function (id) {
        $scope.modalTitle = "Sửa thể loại";
        $scope.watch = false;
        $scope.update = true;
        $scope.smallcategories.forEach(small => {
            if (small.id == id)
                $scope.small_category = small;
        });
        $('#modal2').modal('show');
    }
})