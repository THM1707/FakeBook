export class ApiUrlConstants {
  public static DOMAIN = `http://localhost:3000`;
  public static LOGIN = `${ApiUrlConstants.DOMAIN}/auth/login`;
  public static SIGN_UP = `${ApiUrlConstants.DOMAIN}/signup`;
  public static GET_ALL_CATEGORY = `${ApiUrlConstants.DOMAIN}/categories`;
  public static GET_ALL_SHOP = `${ApiUrlConstants.DOMAIN}/pages`;
  public static GET_FAVORITE_POSTS_URL = `${ApiUrlConstants.DOMAIN}/user/getPostsURL`;
  public static SAVE_FAVORITE_POST = `${ApiUrlConstants.DOMAIN}/user/savePost`;
  public static DELETE_FAVORITE_POST = `${ApiUrlConstants.DOMAIN}/user/deletePost`;
  public static CREATE_NEW_SHOP = `${ApiUrlConstants.DOMAIN}/pages/`;
  public static CREATE_NEW_CATEGORY = `${ApiUrlConstants.DOMAIN}/categories/`;

  public static GET_CATEGORY_DETAIL = (categoryName: string) => {
    return `${ApiUrlConstants.DOMAIN}/categories/?name=${categoryName}`;
  }
  public static UPDATE_CATEGORY = (categoryId: string) => {
    return `${ApiUrlConstants.DOMAIN}/categories/${categoryId}`;
  }
  public static UPDATE_SHOP = (shopId: String) => {
    return `${ApiUrlConstants.DOMAIN}/pages/${shopId}`;
  }
  public static DELETE_SHOP = (shopId: String) => {
    return `${ApiUrlConstants.DOMAIN}/pages/${shopId}`;
  }
  public static GET_FAVORITE_POSTS = (page: number) => {
    return `${ApiUrlConstants.DOMAIN}/user/getPosts?page=${page}`;
  }
  public static GET_ALL_POST = (page: number) => {
    return `${ApiUrlConstants.DOMAIN}/post/all?page={page}`;
  }

  public static GET_POST_BY_CATEGORY = (category: String, page: number) => {
    if (category !== 'all') {
      return `${ApiUrlConstants.DOMAIN}/posts?category=${category}&page=${page}`;
    } else {
      return `${ApiUrlConstants.DOMAIN}/posts?page=${page}`;
    }
  }

  public static SEARCH_POST = (keyword: String, shop: String, category: String, page: number, limit: number) => {
    let url = `/posts?page=${page}&limit=${limit}`;
    if (category) {
      url += `&category=${category}`;
    }

    if (keyword != null && keyword.length !== 0) {
      url += `&filter=${keyword}`;
    }
    if (shop != null && shop.length !== 0) {
      url += `&shop=${shop}`;
    }
    return ApiUrlConstants.DOMAIN + url;
  }


}
