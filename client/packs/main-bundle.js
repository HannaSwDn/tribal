import ReactOnRails from 'react-on-rails';

import Main from '../bundles/Main/components/Main';
import App from '../bundles/Main/components/App';
import ShowSession from '../bundles/Main/components/sessions/ShowSession';
import StartSession from '../bundles/Main/components/sessions/StartSession';
import MySessions from '../bundles/Main/components/sessions/MySessions';

ReactOnRails.register({
	App,
	Main,
	ShowSession,
	StartSession,
	MySessions
});
