export interface Cars {
    id: number;
    brand: string;
    carType: string;
    cc: string;
    city: string;
    company: string;
    country: string;
    createdAt: { timestamp: number };
    createdBy: string;
    description: string;
    distance: string;
    engine: string;
    entity: string;
    fuel: string;
    gearType: string;
    image: string;
    imageUser: string;
    price: number;
    reaction: [{ reactionCount: number; createdBy: boolean; }];
    state: string;
    status: string;
    updateAt: { timestamp: number };
    userName: string;
    yearOfRelease: { timestamp: number };
}