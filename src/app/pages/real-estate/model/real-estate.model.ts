export interface RealEstate {
  id: number;
  userName: string;
  image: string;
  imageUser: string;
  company: string;
  price: number;
  space: string;
  numberOfFloors: number;
  homeFurnishing: string;
  realEstateType: string;
  rooms: string;
  description: string;
  status: string;
  state: string;
  entity: string;
  updatedAt: string;
  country: string;
  city: string;
  cladding: string;
  createdAt: { timestamp: number };
  reaction: [{reactionCount: number; createdBy: boolean; }];


}
