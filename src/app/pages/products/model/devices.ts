export interface Devices {
    id: number;
    battery: string;
    brand: string;
    city: string;
    country: string;
    cpu: string;
    createdAt: { timestamp: number };
    description: string;
    durationOfUse: string;
    gauge: string;
    entity: string;
    image: string;
    imageUser: string;
    price: number;
    ram: string;
    reaction: [{reactionCount: number; createdBy: boolean; }];
    status: string;
    type: string;
    userName: string;
    yearOfRelease: { timestamp: number };   
}