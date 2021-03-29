export interface SidebarMenuItemsChildren {
    title?: string;
    link?: string;
    translate?: string;
    value?: string;         // use if we want to add function to this link
}
export interface SidebarMenuItems {
    id?: string;            // use only if there is children for this item
    title?: string;
    link?: string;
    children?: SidebarMenuItemsChildren[];
    translate?: string;
    icon?: string;
}
export const SIDEBAR_MENU_ITEM: SidebarMenuItems[] = [

    {
        title: 'Dashboard',
        translate: 'dashboard',
        icon: 'fa fa-tachometer',
        link: '/'
      },
    {
        title: 'Products',
        id: 'products',
        translate: 'products',
        icon: 'fa fa-tags',
        children: [
            {
                title: 'All Products',
                translate: 'all-products',
                link: '/products',
            },
            {
                title: 'All Cars',
                translate: 'all-cars',
                link: '/cars',
            },
            {
                title: 'All Devices',
                translate: 'all-devices',
                link: '/devices',
            },
            {
                title: 'All Real Estate',
                translate: 'all-real-estate',
                link: '/real-estate',
            },
        ]
    },
    {
        title: 'Reports',
        translate: 'reports',
        icon: 'fa fa-files-o',
        link: '/reports',
    },
    {
      title: 'Chats',
      translate: 'chats',
      icon: 'fa fa-comments',
      link: '/chats'
    }
];
