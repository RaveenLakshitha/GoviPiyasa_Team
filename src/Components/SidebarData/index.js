import ContactPhoneIcon from "@mui/icons-material/ContactPhone";
import DeliveryDiningIcon from "@mui/icons-material/DeliveryDining";
import ForumIcon from "@mui/icons-material/Forum";
import HomeIcon from "@mui/icons-material/Home";
import InfoIcon from "@mui/icons-material/Info";
import LocalFloristIcon from "@mui/icons-material/LocalFlorist";
import PeopleIcon from "@mui/icons-material/People";
import PersonIcon from "@mui/icons-material/Person";
import SettingsIcon from "@mui/icons-material/Settings";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import StoreIcon from "@mui/icons-material/Store";

export const SidebarData = [
  {
    title: "Dashboard",
    icon: <HomeIcon />,
    link: "/",
  },
  {
    title: "Login",
    icon: <HomeIcon />,
    link: "/login",
  },
  {
    title: "Users",
    icon: <PeopleIcon />,
    link: "/user",
  },
  {
    title: "Shops",
    icon: <StoreIcon />,
    link: "/shop",
  },
  {
    title: "Experts",
    icon: <ContactPhoneIcon />,
    link: "/expert",
  },
  {
    title: "Architectures",
    icon: <PersonIcon />,
    link: "/architect",
  },
  {
    title: "Items",
    icon: <LocalFloristIcon />,
    link: "/items",
  },
  {
    title: "Orders",
    icon: <ShoppingCartIcon />,
    link: "/orders",
  },
  {
    title: "Forum",
    icon: <ForumIcon />,
    link: "/forum",
  },

  {
    title: "Delivery",
    icon: <DeliveryDiningIcon />,
    link: "/delivery",
  },
  {
    title: "Information",
    icon: <InfoIcon />,
    link: "/information",
  },
  {
    title: "Setting",
    icon: <SettingsIcon />,
    link: "/setting",
  },
];
