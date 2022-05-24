import Home from '../views/home/index'
import Registrasi from '../views/auth/registrasi'
import Karyawan from '../views/Karyawan/Index'
import Category from '../views/category/Index'
import Activity from '../views/activity/index'
import Asset from '../views/asset/index'
import Possibility from '../views/Possibility/Index'
import Mitigasi from '../views/Mitigasi/Index'
import Condition from '../views/Condition/Index'
import Threat from '../views/Threat/Index'
import Vulnerability from '../views/Vulnerability/index'
import Term from '../views/Term/Index'
import Consequence from '../views/Consequence/Index'
import createConsequence from '../views/consequence/create'
import editConsequence from '../views/consequence/edit'
import K3team from '../views/K3team/Index'
import Register from '../views/Register/Index'
import createRegister from '../views/Register/create'
import editRegister from '../views/Register/edit'
import tahunRegister from '../views/Register/tahun'
import Unit from '../views/Unit/Index'
import Login from '../views/auth/login'
import CetakRegister from '../views/register/cetakregister'
import Registerpertanggal from '../views/cetakregister/index'


export default
{
    mode:'history',
    linkActiveClass:'active',
    routes: [
        {
            path:'/',
            name:'home',
            component: Home,
        },
        {
            path: '/login',
            name:'login',
            component: Login
        },
        {
            path: '/registrasi',
            name:'registrasi',
            component: Registrasi
        },
        {
            path:'/karyawan',
            name:'karyawan',
            component: Karyawan,
        },
        {
            path:'/category',
            name:'category',
            component: Category,
        },
        /* {
            path:'/createconsequence/',
            name:'category.createConsequence',
            component: createConsequence,
        },
        {
            path:'/editconsequence/:id',
            name:'category.editConsequence',
            component: editConsequence,
            props: true,
        }, */
        {
            path:'/activity',
            name:'activity',
            component: Activity,
        },
        {
            path:'/asset',
            name:'asset',
            component: Asset,
        },
        {
            path:'/possibility',
            name:'possibility',
            component: Possibility,
        },
        {
            path:'/mitigasi',
            name:'mitigasi',
            component: Mitigasi,
        },
        {
            path:'/condition',
            name:'condition',
            component: Condition,
        },
        {
            path:'/unit',
            name:'unit',
            component: Unit,
        },
        {
            path:'/threat',
            name:'threat',
            component: Threat,
        },
        {
            path:'/vulnerability',
            name:'vulnerability',
            component: Vulnerability,
        },
        {
            path:'/term',
            name:'term',
            component: Term,
        },
        {
            path:'/consequence',
            name:'consequence',
            component: Consequence,
        },
        {
            path:'/createconsequence/',
            name:'consequence.create',
            component: createConsequence,
        },
        {
            path:'/editconsequence/:id',
            name:'consequence.edit',
            component: editConsequence,
            props: true,
        },
        {
            path:'/k3team',
            name:'k3team',
            component: K3team,
        },
        {
            path:'/register',
            name:'register',
            component: Register,
        },
        {
            path:'/createregister',
            name:'register.create',
            component: createRegister,
        },
        {
            path:'/editregister/:id',
            name:'register.edit',
            component: editRegister,
        },
        {
            path:'/cetakregister',
            name:'register.cetakregister',
            component: CetakRegister,
        },
        {
            path:'/registerpertanggal',
            name:'Registerpertanggal',
            component: Registerpertanggal,
        },
    ]
}