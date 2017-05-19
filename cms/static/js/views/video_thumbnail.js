define(
    ['underscore', 'gettext', 'moment', 'js/utils/date_utils', 'js/views/baseview',
        'common/js/components/utils/view_utils', 'edx-ui-toolkit/js/utils/html-utils',
        'edx-ui-toolkit/js/utils/string-utils', 'text!templates/video-thumbnail.underscore'],
    function(_, gettext, moment, DateUtils, BaseView, ViewUtils, HtmlUtils, StringUtils, VideoThumbnailTemplate) {
        'use strict';

        var VideoThumbnailView = BaseView.extend({

            actionsInfo: {
                upload: {
                    icon: '',
                    text: gettext('Add Thumbnail')
                },
                edit: {
                    icon: '<span class="icon fa fa-pencil" aria-hidden="true"></span>',
                    text: gettext('Edit Thumbnail')
                },
                error: {
                    icon: '<span class="icon fa fa-exclamation-triangle" aria-hidden="true"></span>',
                    text: gettext('Image upload failed')
                },
                progress: {
                    icon: '<span class="icon fa fa-spinner fa-pulse fa-spin" aria-hidden="true"></span>',
                    text: gettext('Uploading')
                },
                requirements: {
                    icon: '',
                    text: HtmlUtils.interpolateHtml(
                        // Translators: This is a 3 part text which tells the image requirements.
                        gettext('Image requirements {lineBreak} 1280px by 720px {lineBreak} .jpg | .png | .gif'),
                        {
                            lineBreak: HtmlUtils.HTML('<br>')
                        }
                    ).toString()
                }
            },

            events: {
                'click .thumbnail-wrapper': 'chooseFile',
                'mouseover .thumbnail-wrapper': 'showHoverState',
                'mouseout .thumbnail-wrapper': 'hideHoverState',
                'focus .thumbnail-wrapper': 'showHoverState',
                'blur .thumbnail-wrapper': 'hideHoverState'
            },

            initialize: function(options) {
                this.template = HtmlUtils.template(VideoThumbnailTemplate);
                this.imageUploadURL = options.imageUploadURL;
                this.action = this.model.get('course_video_image_url') ? 'edit' : 'upload';
                this.videoImageSupportedFileFormats = options.videoImageSupportedFileFormats;
                //this.videoImageMaxFileSize: this.videoImageMaxFileSize,
                //this.videoImageMinFileSize: this.videoImageMinFileSize,
                this.videoImageMaxFileSize: 2097152,
                this.videoImageMinFileSize: 2048,
                _.bindAll(
                    this, 'render', 'chooseFile', 'imageSelected', 'imageUploadSucceeded', 'imageUploadFailed',
                    'showHoverState', 'hideHoverState'
                );
            },

            render: function() {
                HtmlUtils.setHtml(
                    this.$el,
                    this.template({
                        action: this.action,
                        imageAltText: this.getImageAltText(),
                        videoId: this.model.get('edx_video_id'),
                        actionInfo: this.actionsInfo[this.action],
                        thumbnailURL: this.model.get('course_video_image_url'),
                        duration: this.getDuration(this.model.get('duration')),
                        videoImageSupportedFileFormats: this.getVideoImageSupportedFileFormats(this.videoImageSupportedFileFormats),
                        videoImageMaxFileSize: this.getVideoImageMaxFileSize()
                    })
                );
                this.hideHoverState();
                return this;
            },

            getVideoImageSupportedFileFormats: function(supportedFormatsArray) {
                var supportedFormatsArray = supportedFormatsArray.sort();
                return {
                    humanize: supportedFormatsArray.slice(0, -1).join(', ') + ' or ' + supportedFormatsArray.slice(-1),
                    machine: supportedFormatsArray
                }
            },

            getVideoImageMaxFileSize: function(videoImageMaxFileSize) {
                return {
                    humanize: videoImageMaxFileSize/(1024*1024) + ' MB',
                    machine: videoImageMaxFileSize
                }
            },

            getVideoImageMinFileSize: function(videoImageMinFileSize) {
                return {
                    humanize: videoImageMinFileSize/1024 + ' KB',
                    machine: videoImageMinFileSize
                }
            },

            getImageAltText: function() {
                return StringUtils.interpolate(
                    // Translators: message will be like Thumbnail for Arrow.mp4
                    gettext('Thumbnail for {videoName}'),
                    {videoName: this.model.get('client_video_id')}
                );
            },

            getSRText: function() {
                return StringUtils.interpolate(
                    // Translators: message will be like Add Thumbnail - Arrow.mp4
                    gettext('Add Thumbnail - {videoName}'),
                    {videoName: this.model.get('client_video_id')}
                );
            },

            getDuration: function(durationSeconds) {
                if (durationSeconds <= 0) {
                    return null;
                }

                return {
                    humanize: this.getDurationTextHuman(durationSeconds),
                    machine: this.getDurationTextMachine(durationSeconds)
                };
            },

            getDurationTextHuman: function(durationSeconds) {
                var humanize = this.getHumanizeDuration(durationSeconds);

                // This case is specifically to handle values between 0 and 1 seconds excluding upper bound
                if (humanize.length === 0) {
                    return '';
                }

                return StringUtils.interpolate(
                    // Translators: humanizeDuration will be like 10 minutes, an hour and 20 minutes etc
                    gettext('Video duration is {humanizeDuration}'),
                    {
                        humanizeDuration: humanize
                    }
                );
            },

            getHumanizeDuration: function(durationSeconds) {
                var minutes,
                    seconds,
                    minutesText = null,
                    secondsText = null;

                minutes = Math.trunc(moment.duration(durationSeconds, 'seconds').asMinutes());
                seconds = moment.duration(durationSeconds, 'seconds').seconds();

                if (minutes) {
                    minutesText = minutes > 1 ? gettext('minutes') : gettext('minute');
                    minutesText = StringUtils.interpolate(
                        // Translators: message will be like 15 minutes, 1 minute
                        gettext('{minutes} {unit}'),
                        {minutes: minutes, unit: minutesText}
                    );
                }

                if (seconds) {
                    secondsText = seconds > 1 ? gettext('seconds') : gettext('second');
                    secondsText = StringUtils.interpolate(
                        // Translators: message will be like 20 seconds, 1 second
                        gettext('{seconds} {unit}'),
                        {seconds: seconds, unit: secondsText}
                    );
                }

                // Translators: `and` will be used to combine both miuntes and seconds like `13 minutes and 45 seconds`
                return _.filter([minutesText, secondsText]).join(gettext(' and '));
            },

            getDurationTextMachine: function(durationSeconds) {
                var minutes = Math.floor(durationSeconds / 60),
                    seconds = Math.floor(durationSeconds - minutes * 60);
                return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
            },

            chooseFile: function() {
                this.$('.upload-image-input').fileupload({
                    url: this.imageUploadURL + '/' + encodeURIComponent(this.model.get('edx_video_id')),
                    add: this.imageSelected,
                    done: this.imageUploadSucceeded,
                    fail: this.imageUploadFailed
                });
            },

            imageSelected: function(event, data) {
                var errorMessage = this.validateImageFile(data.files[0]);
                if (!errorMessage) {
                    data['global'] = false;   // Do not trigger global AJAX error handler
                    this.readMessages([gettext('Video image upload started')]);
                    this.showUploadInProgressMessage();
                    data.submit();
                } else {
                    this.readMessages([errorMessage]);
                }
            },

            imageUploadSucceeded: function(event, data) {
                this.action = 'edit';
                this.setActionInfo(this.action, false);
                this.$('img').attr('src', data.result.image_url);
                this.readMessages([gettext('Video image upload completed')]);
            },

            imageUploadFailed: function(event, data) {
                var errorText = JSON.parse(data.jqXHR.responseText)['error'];
                this.action = 'error';
                this.setActionInfo(this.action, true);
                this.readMessages([gettext('Video image upload failed'), errorText]);
                this.$el.css('border-top', 'none');
                // TODO: remove error after some delay.
                // TODO: remove if new error is coming.
                $('<tr><td class="thumbnail-error" colspan="6">' + errorText + '</td></tr>').insertBefore(this.$el.parent());
            },

            showUploadInProgressMessage: function() {
                this.action = 'progress';
                this.setActionInfo(this.action, true);
            },

            showHoverState: function() {
                if (this.action === 'upload') {
                    this.setActionInfo('requirements', true, this.getSRText());
                } else if (this.action === 'edit') {
                    this.setActionInfo(this.action, true);
                }
                this.$('.thumbnail-wrapper').addClass('focused');
            },

            hideHoverState: function() {
                if (this.action === 'upload') {
                    this.setActionInfo(this.action, true);
                } else if (this.action === 'edit') {
                    this.setActionInfo(this.action, false);
                }
            },

            setActionInfo: function(action, showText, additionalSRText) {
                this.$('.thumbnail-action').toggle(showText);
                this.$('.thumbnail-action .action-icon').html(this.actionsInfo[action].icon);
                this.$('.thumbnail-action .action-text').html(this.actionsInfo[action].text);
                this.$('.thumbnail-action .action-text-sr').text(additionalSRText || '');
                this.$('.thumbnail-wrapper').attr('class', 'thumbnail-wrapper {action}'.replace('{action}', action));
            },

            validateImageFile: function(imageFile) {
                var errorMessage = '';
                // working here
                var self = this,
                    fileName,
                    fileType;

                fileName = file.name;
                fileType = fileName.substr(fileName.lastIndexOf('.'));
                // validate file type
                if (!_.contains(self.getVideoImageSupportedFileFormats().machine, fileType)) {
                    errorMessage = gettext(
                        '{filename} is not in a supported file format. ' +
                        'Supported file formats are {supportedFileFormats}.'
                    )
                    .replace('{filename}', fileName)
                    .replace('{supportedFileFormats}', self.getVideoImageSupportedFileFormats().humanize);
                } else if (file.size > self.getVideoImageMaxFileSize().machine) {
                    errorMessage = gettext(
                        '{filename} exceeds maximum size of {maxFileSizeInMB}.'
                    )
                    .replace('{filename}', fileName)
                    .replace('{maxFileSizeInMB}', self.getVideoImageMaxFileSize().humanize);
                } else if (file.size < self.getVideoImageMinFileSize().machine) {
                    errorMessage = gettext(
                        '{filename} subceeds minimum size of {minFileSizeInKB}.'
                    )
                    .replace('{filename}', fileName)
                    .replace('{minFileSizeInKB}', self.getVideoImageMinFileSize().humanize);
                }

                return errorMessage;
            },

            readMessages: function(messages) {
                if ($(window).prop('SR') !== undefined) {
                    $(window).prop('SR').readTexts(messages);
                }
            }
        });

        return VideoThumbnailView;
    }
);
