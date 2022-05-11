import HomeIcon from '@mui/icons-material/Home';
import StoreIcon from '@mui/icons-material/Store';
import PeopleIcon from '@mui/icons-material/People';
import ContactPhoneIcon from '@mui/icons-material/ContactPhone';
import PersonIcon from '@mui/icons-material/Person';
import LocalFloristIcon from '@mui/icons-material/LocalFlorist';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import ForumIcon from '@mui/icons-material/Forum';
import DeliveryDiningIcon from '@mui/icons-material/DeliveryDining';
import InfoIcon from '@mui/icons-material/Info';
import SettingsIcon from '@mui/icons-material/Settings';

export const SidebarData = [
  { 
    title : "Dashboard",
    icon : <HomeIcon/>,
    link : "/"
  },
  { 
    title : "Users",
    icon : <PeopleIcon/>,
    link : "/user"
  },
  { 
    title : "Shops",
    icon : <StoreIcon/>,
    link : "/shop"
  },
  { 
    title : "Experts",
    icon : <ContactPhoneIcon/>,
    link : "/expert"
  },
  { 
    title : "Architectures",
    icon : <PersonIcon/>,
    link : "/architect"
  },
  { 
    title : "Items",
    icon : <LocalFloristIcon/>,
    link : "/items"
  },
  { 
    title : "Orders",
    icon : <ShoppingCartIcon/>,
    link : "/orders"
  },
  { 
    title : "Forum",
    icon : <ForumIcon/>,
    link : "/forum"
  },
  { 
    title : "Delivery",
    icon : <DeliveryDiningIcon/>,
    link : "/delivery"
  },
  { 
    title : "Information",
    icon : <InfoIcon/>,
    link : "/information"
  },
  { 
    title : "Setting",
    icon : <SettingsIcon/>,
    link : "/setting"
  },
]