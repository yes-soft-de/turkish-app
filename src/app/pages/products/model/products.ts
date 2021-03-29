export interface Products {
    id: number;
    city: string;
    cladding: string;
    country: string;
    createdAt: { timestamp: number };
    description: string;
    entity: string;
    gauge: string;
    image: string;
    imageUser: string;
    numberOfFloors: string;
    price: number;
    reaction: [{reactionCount: number; createdBy: boolean; }];
    realEstateType: string;
    rooms: string;
    space: string;
    state: string;
    status: string;
    userName: string;   
}