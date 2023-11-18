
# Football score Live Activity
Football match score LiveActivity widget example using OneSignal service.
&nbsp;

<img src="https://github.com/MaurixFx/LiveActivityExample/assets/28694208/6ba13ac0-be17-4026-9258-eb1a6a10e931" width= 250 />


https://github.com/MaurixFx/LiveActivityExample/assets/28694208/4e0cab24-94dc-4ead-9b90-7db6cb95ae3e


&nbsp;
# How to configure OneSignal SDK in your project
Please follow the steps on [ONESignal documentation](https://documentation.onesignal.com/docs/how-to-create-and-update-a-live-activity)

&nbsp;
# How to test push live activity for this Football score

- After you configure your OneSignal APP ID,
- Add your OneSignal APP ID on AppDelegate.

```
OneSignal.initialize("YOUR_ONE_SIGNAL_APP_ID", withLaunchOptions: launchOptions)
```

- Run the app and press the button Start a live activity
- Go to the lock screen
- You should be able to see your live activity widget with the initial state

&nbsp;
<img src="https://github.com/MaurixFx/LiveActivityExample/assets/28694208/d4212b81-cc37-4932-bac7-f324ad611f29" width= 250 />

&nbsp;
The next step is to send an update to see how our live activity updates the score and the event description.

&nbsp;
In this CURL command replace the following ID's for your personal data, you can find this information on the OneSignal [dashboard](https://dashboard.onesignal.com/apps/)
- YOUR_ONE_SIGNAL_APP_ID
- YOUR_REST_API_KEY

&nbsp;

  ```
curl --request POST \
     --url https://onesignal.com/api/v1/apps/YOUR_ONE_SIGNAL_APP_ID/live_activities/live_activity_id/notifications \
     --header 'Authorization: Basic YOUR_REST_API_KEY' \
     --header 'Content-Type: application/json' \
     --header 'accept: application/json' \
     --data '
{
  "event": "update",
  "event": "update",
        "event_updates":  {
            "localScoreText": "1",
            "awayScoreText": "0",
            "matchEventType": "goal",
            "matchEventDescription": "Cristiano Ronaldo"
        },
   "name": "test update"
}
'
```
