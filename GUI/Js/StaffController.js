
// app.controller('staffcontroller', function ($http, $scope, $sce, $location, $filter, $compile) {
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
//     $scope.closeModal = function () {
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
//         $scope.postform.$setPristine();
//         // $scope.myform.birthday.$pristine = true;
//         // $scope.myform.birthday.$touched = false;
//         // $scope.myform.gender.$pristine = true;
//         // $scope.myform.gender.$touched = false;
//         // $scope.myform.start_day.$pristine = true;
//         // $scope.myform.start_day.$touched = false;
//         // $scope.myform.job.$pristine = true;
//         // $scope.myform.job.$touched = false;
//         $('#modal').modal('hide');
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
//                 console.log($scope.post,$scope.post.feed[0]);
//                 $scope.big_category = $scope.post.small_category.category.id;
//                 $scope.imageSource = $scope.baseURL+"posts/"+ $scope.post.author.id+"/" + $scope.post.image;
//                 var date = new Date($scope.post.created_at);
//                 $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");
//                 $scope.post.updated_at = moment($scope.post.updated_at).format("DD/MM/YYYY H:mm:ss");
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
//     $scope.showPost2 = function (id) {  
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
//     $scope.execute = function () {
//         if ($('#addbtn').text() == 'Thêm')
//             $scope.addStaff();
//         else $scope.updateStaff();
//         $scope.myform.$setPristine();
//     }

//     $scope.updatePost = function () {
//         const formData = new FormData();
//         formData.append('file', $scope.file);
//         var post = JSON.stringify($scope.post);
//         formData.append('post', post);
//         $http({
//             method: 'post',
//             url: '/user/staff/api/updatepost',
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
//             $scope.getItems();
//             $scope.loading = false;
//             $scope.closeModal();
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
//                 url: '/user/staff/api/deletepost',
//                 data: { id: id },
//             }).then((response) => {
//                 console.log(response.data);
//                 $scope.getItems();
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

//     $scope.loadBigCategories = function () {
//         $http.get('/user/staff/api/getbigcategories').then((response) => {
//             $scope.bigcategories = response.data;
//             $scope.big_category = response.data[0].id;
//             $scope.changeCategory();
//             $scope.loading = false;
//             $('#postup').show();
//         })
//     }
//     $scope.changeCategory = function () {
//         $http({
//             method: 'post',
//             url: '/user/staff/api/getsmallcategories',
//             data: { big_category: $scope.big_category }
//         }).then((response) => {
//             $scope.smallcategories = response.data;
//             $scope.post.small_category = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';
//             // if ($scope.post.small_category == '')
//             //     $('#uppost').prop('disabled', true);
//             // else $('#uppost').prop('disabled', false);
//             console.log(response.data);
//         })
//     }
//     $scope.posts = [];
//     $scope.totalPages = 0;
//     $scope.currentPage = 1;
//     $scope.itemPerPage = 10;
//     $scope.range = [];

//     $scope.sorting = function(){
//         var url = new URL(window.location.href);
//         var orderBy = url.searchParams.get('orderBy');
//         var param = $location.search();
//         console.log(param.page);
//         if(!param.page)
//         $location.search({'orderBy':$scope.orderBy}); 
//         else
//         $location.search({'page':param.page,'orderBy':$scope.orderBy})
//         var param = $location.search();
//         console.log(param);
//         $scope.getItems();
//         //console.log(param);
//         var orderBy = param.orderBy;
//         //$location.search({'orderBy':$scope.orderBy});
//         // if(!orderBy){
//         //     // url.searchParams.append('orderBy',$scope.orderBy);
//         //     $location.search({'orderBy':$scope.orderBy});
//         // }
//         // else
//         //     $location.search({'orderBy':$scope.orderBy});
//        // window.location = url.href;
//     }

//     $scope.getUrl = function(page){      
//         //var url = new URL(window.location.href);
//         //var pageNumber = url.searchParams.get('page');   
//         var param = $location.search();
//         var orderBy = param.orderBy;
//         if(!orderBy)           
//         $location.search({'page':page});
//         else
//         $location.search({'page':page,'orderBy':$scope.orderBy})
//         // if(!pageNumber){
//         //     // url.searchParams.append('page',page);
//         //     $location.search({'page':page});
//         // }
//         // else
//         //     // url.searchParams.set('page',page);
//         //     $location.search({'page':page});
//         var param = $location.search();
//         console.log(param);
//         $scope.getItems();
//         //window.location = url.href;
//     }
//     $scope.getItems = function () {
//         $scope.loading = true;
//         //var pageNumber =$location.search().page;
//         // if(!pageNumber)
//         //     pageNumber = 1;
//         // var url = new URL(window.location.href);
//         // var param = $location.search();
//         // console.log(param);
//         // var pageNumber = parseInt(url.searchParams.get("page"));
//         // var orderBy = url.searchParams.get("orderBy");
//         var param = $location.search();
//         var pageNumber = param.page;
//         var orderBy = param.orderBy;
//         $scope.orderBy = orderBy;
//         if(!orderBy)
//             $scope.orderBy = 'newest';
//         console.log(pageNumber);
//         if(!pageNumber)
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
//             CKEDITOR.on('instanceReady', function() { });
//             $scope.loading = false;$('#main').show(); 
//             $('.pagination').html($compile(response.data[1])($scope));
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
//     // $scope.sort = function(column,reverse) {
//     //     $scope.posts = $filter('orderBy')($scope.posts,column,reverse);
//     // };


// })
app.controller('staffcontroller', function ($scope, $http, $location) {
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
            url: api_url + 'post/get-my-posts',
            headers: { 'Authorization': 'Bearer ' + $scope.user.token },
            data: { page: pageNumber, pageSize: $scope.itemPerPage, id: $scope.user.id }
        }).then((response) => {
            console.log(response.data);
            $scope.posts = response.data.data;
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
            //$scope.post.small_category_id = $scope.smallcategories[0] ? $scope.smallcategories[0].id : '';          
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
                console.log($scope.post.small_category_id);
                $scope.big_category = $scope.post.big_category_id;
                $scope.imageSource = '/storage/uploads2/' + $scope.post.image;
                var date = new Date($scope.post.created_at);
                $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");

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
                $scope.imageSource = '/storage/uploads2/' + $scope.post.image;
                $scope.post.created_at = moment($scope.post.created_at).format("DD/MM/YYYY H:mm:ss");
                //$scope.changeCategory();
                // $http({
                //     method: 'post',
                //     url: '/user/staff/api/getsmallcategories',
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
    $scope.deletePost = function (id) {
        if (confirm('Bạn có chắc muốn xóa?'))
            $http({
                method: 'post',
                url: api_url+'post/delete-post',
                headers:{'Authorization':'Bearer '+$scope.user.token},
                data: { id: id },
            }).then((response) => {
                console.log(response.data);
                $scope.getItems();
            })

    }
})
