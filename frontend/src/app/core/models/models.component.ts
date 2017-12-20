export class User {
  name: String;
  password: String;
  favUrls: String[];
  postsFromFavUrls: String[];
  postId: String[];
  token: String;
  admin: boolean;
}

export class Post {
  _id: String;
  id: String;
  permalink_url: String;
  likes: number;
  comments: number;
  category: String;
  __v: number;
  shares: number;
}

export class Category {
  id: string;
  name: string;
  alias: string;
  keywords: string[];
}

export class Shop {
  id: string;
  name: string;
  permalink_url: string;
  category: string[];
  categoryName: string[];
}
