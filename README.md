# 阳光学院校园食堂app

本项目基于Flutter v2.5
使用纯Flutter开发，后端使用SpringBoot.

#### [后端链接](https://github.com/YfNightWind/Yango-Canteen-Backend) 欢迎大家点个star

##### APK下载地址
[百度网盘链接](https://pan.baidu.com/s/1yoRds1hesrjKTApkBfyw9Q) 提取码：naj1 

## 主要功能如下

- [x] 登录
    - [x] UI绘画
    - [x] 全局登录状态保留 
- [x] 注册
- [ ] 首页
    - [x] 轮播图
    - [ ] 当前最受欢迎的店铺
- [x] 分类页面
- [ ] 个人界面
    - [ ] 个人中心
        - [ ] 可修改用户名
        - [ ] 可修改头像
    - [ ] 用户信息展示
    - [ ] 用户喜欢的菜品显示
    - [ ] 用户的收藏显示
    - [ ] 用户的评论显示 
    - [x] 反馈页面
- [x] 按楼层查询
- [ ] 失物招领功能
    - [ ] UI绘画
    - [ ] 上传图片功能实现
- [ ] 点开后菜品的具体页面    

### 待解决的问题

- [ ] 将楼层的数据进行封装，可以通过TabBar的index直接进行楼层数据的请求
- [ ] 每次切换Tab`Null check operator used on a null value`的问题
- [ ] 解决接口请求的时候需有返回index，而不是string，这样子会导致未点击店名之前不会展示任何数据
- [ ] 点击店名后希望有个选中的交互反馈
- [ ] 适配UI
- [ ] 注册出现重复用户名拒绝
