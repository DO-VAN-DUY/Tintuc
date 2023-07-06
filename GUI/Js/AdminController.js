
// app.filter('unsafe', function ($sce) {
//     return $sce.trustAsHtml;
// });
// app.controller('admincontroller', function ($http, $scope, $sce, $location  ) {
//     $scope.safeHTML = function (text) {
//         return $sce.trustAsHtml(text);
//     }
//     $scope.baseURL = '/storage/uploads/';
//     $scope.imageSource = '';
//     $scope.loading = true;
//     $scope.file = '';
//     $scope.loadbar = false;
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
//         $scope.modalTitle = 'Thêm nhân viên';
//         $scope.myform.$setPristine();
//         $('#addbtn').text('Thêm');
//         $scope.staff ={};    
//         $('#inputUsername').prop('disabled',false);          
//         $('#inputPass').prop('disabled',false);     
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
//         $scope.myform.$setPristine();
//         $scope.myform.birthday.$pristine = true;
//         $scope.myform.birthday.$touched = false;
//         $scope.myform.gender.$pristine = true;
//         $scope.myform.gender.$touched = false;
//         $scope.myform.start_day.$pristine = true;
//         $scope.myform.start_day.$touched = false;
//         $scope.myform.job.$pristine = true;
//         $scope.myform.job.$touched = false;
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
//     $scope.showStaff = function(id){
//         $http.get('/user/admin/api/getonestaff/'+ id)
//         .then((response)=>{            
//             $scope.staff = response.data[0];
//             $scope.staff.password = '***';
//             $scope.staff.gender = response.data[0].gender.toString();
//             $('#inputUsername').prop('disabled',true);         
//             var date =response.data[0].start_day.split('-');
//             $scope.staff.start_day = date[2] +'/'+date[1]+'/'+date[0];
//             var date =response.data[0].birthday.split('-');
//             $scope.staff.birthday = date[2] +'/'+date[1]+'/'+date[0];
//             $scope.staff.email = response.data[0].user.email;
//             $scope.staff.username = response.data[0].user.name;        
//             $scope.modalTitle = 'Sửa nhân viên';                          
//             $('#addbtn').text('Sửa');
//             $('#modal').modal('show');
//         })
//     }
//     $scope.execute = function(){
//         if($('#addbtn').text()=='Thêm')
//             $scope.addStaff();
//         else $scope.updateStaff();
//         $scope.myform.$setPristine();
//     }

//     $scope.updateStaff = function(){
//         $scope.loading = true;
//         console.log($scope.staff);
//         $http({
//             method:'post',
//             url:'/user/admin/api/updatestaff',
//             data: $scope.staff,
//         }).then((response)=>{
//             $scope.getItems();
//             $scope.loading =false;
//             $scope.closeModal();           
//         })
//     }
//     $scope.deleteStaff = function(id){
//         if(confirm('Bạn có chắc muốn xóa?'))
//         $http({
//             method:'post',
//             url:'/user/admin/api/deletestaff',
//             data: {id: id},
//         }).then((response)=>{
//             console.log(response.data);
//             $scope.getItems();
//             $scope.loading =false;                
//         })

//     }
//     $('#datepicker2').on('blur', function () {
//         let value = $('#datepicker2').val();
//         let format = $('#datepicker2').datepicker('option', 'dateFormat', 'dd/mm/yy');
//         let valueIsValid = false;
//         try {
//             $('#datepicker2').datepicker.parseDate(format, value);
//             valueIsValid = true;
//             console.log(valueIsValid);
//         }
//         catch (e) { }
//     })
//     $scope.getFile = function () {
//         var reader = new FileReader();
//         reader.onload = (function () {
//             return function (e) {
//                 $scope.imageSource = e.target.result;
//                 //$('#avatar').attr('ng-src', $scope.imageSource);
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
//     $scope.staffs = [];
//     $scope.totalPages = 0;
//     $scope.currentPage = 1;
//     $scope.itemPerPage = 3;
//     $scope.range = [];
//     $scope.count = 0;
//     $scope.getItems = function () {    
//         $scope.loading = true;
//         //var pageNumber =$location.search().page;
//         // if(!pageNumber)
//         //     pageNumber = 1;
//         var url = new URL(window.location.href);
//         var pageNumber =parseInt(url.searchParams.get("page"));
//         if(!pageNumber)
//             pageNumber=1;    
//         console.log(pageNumber);
//         $http.get('/user/admin/api/getstaff' + '?page='+pageNumber).then(function (response) {
//             $scope.staffs = response.data[0].data;
//             if($scope.staffs=='')
//                 $('#tablestaff').html('Không có dữ liệu');
//             $scope.totalPages = response.data[0].last_page;
//             $scope.currentPage = response.data[0].current_page;
//             var pages = [];
//             for (var i = 1; i <= response.data[0].last_page; i++) {
//                 pages.push(i);
//             }
//             $scope.range = pages;
//             $scope.loading = false;
//             $('.pagination').html(response.data[1]);
//             console.log(response.data);
//             $('#main').show();
//         });
//     };
//     $scope.loadlogo = function(){
//         $http.get('/user/admin/api/logo').then((response)=>{
//             $scope.loading = false;       
//             $scope.imageSource ='/storage/uploads/logo/'+ response.data[2]+'/'+ response.data[0].logo;
//             $scope.footer = response.data[1].content ?? '';
//             console.log(response.data);
//             $('#thongtin').show();
//         })
//     }
//     $scope.confirmLogo = function () {
//         const formData = new FormData();
//         formData.append('file', $scope.file);
//         //$scope.loading = true;
//         $scope.loadbar = true;
//         $('#loadText').text('Đang tải...');
//         $http({
//             method: 'post',
//             url: '/user/admin/api/changelogo',
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
//         });
//     }
//     $scope.confirmFooter = function(){  
//         $scope.footer = CKEDITOR.instances['editor1'].getData();
//         console.log($scope.footer);
//         $http({
//             method:'post',
//             url:'/user/admin/api/changefooter',
//             data: {content: $scope.footer},
//         }).then((response)=>{
//             alert('Cập nhật thành công');
//             console.log(response.data);
//         })
//     }
//     $scope.totalViews = function(){
//         $http.get('/user/admin/api/totalviews').then((response)=>{
//             console.log(response.data);
//             $scope.totalViews = response.data;
//         })
//     }
// })
app.controller('admincontroller', function ($scope, $http, $location) {
    $scope.logout = function(){
        localStorage.removeItem('user');
            window.location.href='index.html';
        $('#logout').bind('click',()=>{
            
        })
      
    }
    $scope.user = JSON.parse(localStorage.getItem('user')) ?? null;
    if(!$scope.user) window.location.href = 'index.html';
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
    $scope.getItems = function(){
        var param = $location.search();
        var pageNumber = param.page;
        console.log(param);
        if(!pageNumber)
        pageNumber = 1;
        $http({
            method:'post',
            url:api_url+'users/get-staff-list',
            data:{page: pageNumber, pageSize: $scope.itemPerPage}
        }).then((response)=>{
            console.log(response.data);
            $scope.staffs = response.data.data;
            var pages = [];
           
            $scope.totalPages = Math.ceil(response.data.totalItems/response.data.pageSize);
            for (var i = 1; i <= $scope.totalPages; i++) {
                pages.push(i);
            }
            $scope.range = pages;
            $scope.currentPage = pageNumber;
        }).catch((error)=>{
            console.log(error);
        })
    }
    //$scope.getItems();
    $scope.getUrl = function(page){      
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
        $location.search({'page':page});
        //if(!pageNumber)
           
        
        $scope.getItems();
        //window.location = url.href;
    }
    $scope.showModal = function () {
        $scope.modalTitle = 'Thêm nhân viên';
        $scope.myform.$setPristine();
        $('#addbtn').text('Thêm');
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
    $scope.addStaff = function () {
        console.log($scope.staff);
        $scope.staff.ngaysinh = moment().format('YYYY-MM-DD');
        $http({
            method:'post',
            url:api_url +'users/create-user',
            headers: {'Authorization':'Bearer '+$scope.user.token},
            data:JSON.stringify($scope.staff)
        }).then((response)=>{
            console.log(response.data);
            $scope.getItem();
            $scope.closeModal();
        }).catch((error)=>{
            console.log(error);
        })
    }
    $scope.showStaff = function(id){
        // $http.get('/user/admin/api/getonestaff/'+ id)
        // .then((response)=>{            
        //     $scope.staff = response.data[0];
        //     $scope.staff.password = '***';
        //     $scope.staff.gender = response.data[0].gender.toString();
        //     $('#inputUsername').prop('disabled',true);         
        //     var date =response.data[0].start_day.split('-');
        //     $scope.staff.start_day = date[2] +'/'+date[1]+'/'+date[0];
        //     var date =response.data[0].birthday.split('-');
        //     $scope.staff.birthday = date[2] +'/'+date[1]+'/'+date[0];
        //     $scope.staff.email = response.data[0].user.email;
        //     $scope.staff.username = response.data[0].user.name;        
        //     $scope.modalTitle = 'Sửa nhân viên';                          
        //     $('#addbtn').text('Sửa');
        //     $('#modal').modal('show');
        // })
        $scope.staffs.forEach(staff => {
            if(staff.id == id)
                $scope.staff = staff;
        });
        $scope.staff.ngaysinh = moment().format('DD/MM/YYYY');
        $scope.modalTitle = 'Sửa nhân viên';                          
            $('#addbtn').text('Sửa');
            $('#modal').modal('show');
        console.log($scope.staff);
    }
    $scope.updateStaff = function(){
        $scope.staff.ngaysinh = moment().format('YYYY-MM-DD');
        $http({
            method:'post',
            url:api_url +'users/update-user',
            headers: {'Authorization':'Bearer '+$scope.user.token},
            data:JSON.stringify($scope.staff)
        }).then((response)=>{
            console.log(response.data);
            $scope.getItems();
            $scope.closeModal();
        }).catch((error)=>{
            console.log(error);
        })
    }
    $scope.deleteStaff = function(id){
        if(confirm('Bạn có chắc muốn xóa?'))
        $http({
            method:'post',
            url:api_url +'users/delete-user',
            headers: {'Authorization':'Bearer '+$scope.user.token},
            data:{id:id}
        }).then((response)=>{
            console.log(response.data);
            $scope.getItems();
            $scope.closeModal();
        }).catch((error)=>{
            console.log(error);
        })
        
    }
})