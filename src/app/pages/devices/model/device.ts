export interface Device {
  id: number;
  userName: string;
  image: string;
  userImage: string;
  imageUser: string;
  battery: string;
  brand: string;
  city: string;
  country: string;
  cpu: string;
  description: string;
  durationOfUse: string;
  entity: string;
  gauge: string;
  price: number;
  ram: string;
  reaction: [{reactionCount: number; createdBy: boolean; }];
  status: string;
  type: string;
  updatedAt: { timestamp: number };
  yearOfRelease: { timestamp: number };
  createdBy: { timestamp: number };
  createdAt: { timestamp: number };
}
