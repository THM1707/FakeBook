export class ApiExample {
  public static DOMAIN = 'localhost:6969';
  public static LOGIN = () => {
    // POST
    const requestBody = {
      username: 'username',
      password: 'password',
      remember: 'true'
    };
    // response
    // {
    //   "user": {
    //   "id": "5a14ef3503d8ba2a4d30e153",
    //     "updatedAt": "2017-12-07T15:00:53.385Z",
    //     "createdAt": "2017-11-22T03:29:57.221Z",
    //     "name": "admin",
    //     "password": "$2a$10$1EJNzL49nN/3PAF4XDMmAuFrv2A92U5EQravH9OtrEWNfTvLtivAO",
    //     "__v": 50,
    //     "admin": true,
    //     "postsFromFavUrls": [],
    //     "favUrls": [],
    //     "postId": [
    //     "https://www.facebook.com/TuanOnlineHaNoi/posts/705544956236603",
    //     "https://www.facebook.com/parttime.co/posts/1625623980793144",
    //     "https://www.facebook.com/Torano.vn/videos/1110181315782876/",
    //     "https://www.facebook.com/conversecaugiayvn/posts/1864146230562515",
    //     "https://www.facebook.com/balotot/posts/1504258462998971",
    //     "https://www.facebook.com/TuanOnlineHaNoi/posts/717126755078423:0",
    //     "https://www.facebook.com/vietleathercom/posts/798273210364373",
    //     "https://www.facebook.com/TuanOnlineHaNoi/videos/715840548540377/"
    //   ],
    //     "active": true
    // },
    //   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVhMTRlZjM1MDNkOGJhMmE0ZDMwZTE1MyIsImlhdCI6MTUxMzE1NjAxNCwiZXhwIjoxNTEzNDE1MjE0fQ.spSZdzn6mmjslgA73NWKKYl1If6JX38AfVTte7vMn2U"
    // }
    return `/user/login`;
  }
  public static SIGN_UP = () => {
    // POST
    // request
    const request = {
      username: 'username',
      password: 'password'
    }
    // response
    // {
    //   "user": {
    //   "id": "5a30ee81cdcbd02008eda545",
    //     "updatedAt": "2017-12-13T09:10:25.349Z",
    //     "createdAt": "2017-12-13T09:10:25.349Z",
    //     "name": "fdasfa",
    //     "password": "$2a$10$mwvYID1fyRDQ.PsfNW7jh.yBkJN8ZHKrms5/l0AF9Nwe8RnPiXBOy",
    //     "__v": 0,
    //     "admin": false,
    //     "postsFromFavUrls": [],
    //     "favUrls": [],
    //     "postId": [],
    //     "active": true
    // },
    //   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVhMzBlZTgxY2RjYmQwMjAwOGVkYTU0NSIsImlhdCI6MTUxMzE1NjIyNSwiZXhwIjoxNTEzNDE1NDI1fQ.tmoXMREs-rZpPrsMih5tVhv8TXSAFpOPFTKffnVZeDQ"
    // }
    return '/user/register';
  }
  public static GET_ALL_CATEGORY = () => {
    // GET
    // response
    // [
    //   {
    //     "id": "5a144f41185bd56c0037535f",
    //     "name": "quan",
    //     "alias": "Quần",
    //     "keywords": [
    //       "quần",
    //       "jogger",
    //       "pants"
    //     ],
    //     "__v": 0
    //   },
    //   {
    //     "id": "5a144f41185bd56c00375361",
    //     "name": "tat",
    //     "alias": "Tất",
    //     "keywords": [
    //       "tất",
    //       "vớ",
    //       "sock",
    //       "socks"
    //     ],
    //     "__v": 0
    //   }
    // ]
    return '/category/all';
  }
  public static GET_ALL_SHOP = () => {
    // GET
    // response
    // [
    //   {
    //     "id": "5a145054d2556b6dff336d38",
    //     "name": "AGOSTO Store",
    //     "permalink_url": "agosto.store",
    //     "category": [
    //       "5a144f41185bd56c00375366",
    //       "5a144f41185bd56c0037535f"
    //     ],
    //     "__v": 0
    //   },
    //   {
    //     "id": "5a145052d2556b6dff336d33",
    //     "name": "Torano",
    //     "permalink_url": "torano.vn",
    //     "category": [
    //       "5a144f41185bd56c00375366",
    //       "5a144f41185bd56c0037535f"
    //     ],
    //     "__v": 0
    //   },
    // ]
    return '/page/all';
  }
  public static GET_FAVORITE_POSTS_URL = () => {
    // GET ,require user authentication at header
    // response
    // [
    //   "https://www.facebook.com/TuanOnlineHaNoi/posts/705544956236603",
    //   "https://www.facebook.com/parttime.co/posts/1625623980793144",
    //   "https://www.facebook.com/Torano.vn/videos/1110181315782876/",
    //   "https://www.facebook.com/conversecaugiayvn/posts/1864146230562515",
    //   "https://www.facebook.com/balotot/posts/1504258462998971",
    //   "https://www.facebook.com/TuanOnlineHaNoi/posts/717126755078423:0",
    //   "https://www.facebook.com/vietleathercom/posts/798273210364373",
    //   "https://www.facebook.com/TuanOnlineHaNoi/videos/715840548540377/"
    // ]

    return '/user/getPostsURL';
  };
  public static SAVE_FAVORITE_POST = () => {
    // POST, require authentication
    const request = {
      post: 'postUrl'
    };
    return '/user/savePost';
  }
  public static DELETE_FAVORITE_POST = () => {
    // POST, delete nhung la la post(hoi cho hoang), can authentication
    const requestBody = {
      post: 'postUrl'
    };
    return '/user/deletePost';
  }
  public static CREATE_NEW_SHOP = () => {
    // POST , need admin's permissions
    const body = {
      name: 'shop.name',
      permalink_url: 'shop.permalink_url',
      category: ['categoryID1', 'categoryID2']
    };
    return '/page/';
  }
  public static CREATE_NEW_CATEGORY = () => {
    // POST , need admin's permissions
    // Chu y name la ten ngan nhu kieu ao,alias la ten day du: Áo;con tai sao thi hoi cho Hoang
    const body = {
      name: 'category.name',
      alias: 'category.alias',
      keywords: ['keyword1', 'keyword2']
    };
    return '/category/';
  }

  public static GET_CATEGORY_DETAIL = (categoryName: string) => {
    // GET
    // response
    // {
    //   "id": "5a144f41185bd56c00375366",
    //   "name": "ao",
    //   "alias": "Áo",
    //   "__v": 0,
    //   "keywords": [
    //     "áo",
    //     "bomber",
    //     "hoodie",
    //     "jacket",
    //     "khoác",
    //     "t-shirt"
    //   ]
    // }
    return `/category/${categoryName}`;
  }
  public static UPDATE_CATEGORY = (categoryId: string) => {
    // PUT, need admin's permissions
    const requestBody = {
      name: 'category.name',
      alias: 'category.alias',
      keywords: ['keyword1', 'keyword2']
    };
    return `/category/${categoryId}`;
  }
  public static UPDATE_SHOP = (url: String) => {
    // PUT, need admin's permissions
    const body = {
      name: 'shop.name',
      permalink_url: 'shop.permalink_url',
      category: ['categoryID1', 'categoryID2']
    };
    return `/page/${url}`;
  }
  public static DELETE_SHOP = (url: String) => {
    // DELETE ,need admin's permissions
    return `/page/${url}`;
  }
  public static GET_FAVORITE_POSTS = (page: number) => {
    // GET, need user authentication
    return `/user/getPosts/${page}`;
  }

  public static GET_POST_BY_CATEGORY = (category: String, page: number) => {
    // Neu lay tat ca thi category = all
    return `/post/${category}?page=${page}`;
  }

  public static SEARCH_POST = (keyword: String, shop: String, category: String, page: number, limit: number) => {
    // GET
    if (category == null || category.length === 0) {
      category = 'all';
    }
    let url = `/post/${category}?page=${page}&limit=${limit}`;

    if (keyword != null && keyword.length !== 0) {
      url += `&filter=${keyword}`;
    }
    if (shop != null && shop.length !== 0) {
      url += `&shop=${shop}`;
    }
    return url;
  }

}
