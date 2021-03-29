export interface Statistic {
  id?: number;
  cars?: number;
  chats?: {
    total?: number;
    chatsWithLawyer?: number;
    chatsWithUsers?: number
  };
  devices?: number;
  properties?: number;
  reactions?: {
    carReactions?: number;
    deviceReactions?: number;
    realEstateReactions?: number;
    total?: number;
  };
  realEstates?: number;
  users?: number;
}
