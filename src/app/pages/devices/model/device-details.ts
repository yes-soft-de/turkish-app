export interface DeviceDetails {
  id?: number;
  image?: string;
  username?: string;
  userImage?: string;
  brand?: string;
  type?: string;
  price?: number;
  description?: string;
  status?: string;
  country?: string;
  city?: string;
  createdBy?: string;
  createdAt?: {timestamp: number};
  updatedAt?: {timestamp: number};

  battery?: string;
  cpu?: string;
  durationOfUse?: string;
  gauge?: string;
  images?: {image: string}[];
  ram?: string;
  reaction?: {reactionCount: number; createdBy: boolean; isLoved: boolean; };
  specialLink?: string;
  yearOfRelease?: { timestamp: number };
}
