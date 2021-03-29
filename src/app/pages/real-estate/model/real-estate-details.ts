export interface RealEstateDetails {
  id: number;
  company: string;
  price: number;
  space: string;
  image: string;
  numberOfFloors: number;
  homeFurnishing: string;
  realEstateType: string;
  rooms: number;
  description: string;
  status: string;
  createdAt: { timestamp: number; };
  updatedAt: { timestamp: number; };
  country: string;
  city: string;
  username: string;
  userImage: string;
  cladding: string;
  documents: string;
  images?: {image: string}[];
  reaction: { reactionCount: number; createdBy: boolean; isLoved: boolean; };
  state: string;
}
