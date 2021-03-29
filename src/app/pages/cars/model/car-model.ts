export interface Car {
  brand?: string;
  carType?: string;
  cc?: string;
  city?: string;
  company?: string;
  country?: string;
  createdAt?: { timestamp: number };
  createdBy?: string;
  description?: string;
  distance?: string;
  engine?: string;
  fuel?: string;
  gearType?: string;
  id?: number;
  image?: string;
  images?: {image: string}[];
  price?: number;
  reaction?: {reactionCount: number; createdBy: boolean; isLoved: boolean; };
  state?: string;
  status?: string;
  updateAt?: { timestamp: number };
  userImage?: string;
  username?: string;
  yearOfRelease?: { timestamp: number };
}
